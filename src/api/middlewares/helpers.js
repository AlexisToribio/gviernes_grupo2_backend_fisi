const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const db = require("../../database");
const { SECRET_TOKEN } = require("../../config");
const query = require("../../database/querys/helpers");
const helpers = {};

//FUNCTIONS
helpers.encryptPassword = async (password) => {

    const salt = await bcrypt.genSalt(10);

    const password_hash = bcrypt.hash(password, salt);

    return password_hash;
};

helpers.matchPassword = async (password, savedPassword) => {

    return await bcrypt.compare(password, savedPassword);
};

helpers.isLoggedIn = async (req, res, next) => {
    const token = req.headers["token"];

    if (token) {

        try {

            const decode = await jwt.verify(token, SECRET_TOKEN);

            const result = await db.query(query.getUserData, [decode.id]);

            if (!result) {

                return res.status(500).json({ data: null, message: "The user is not exists" });
            }
            else {

                req.user = result[0];

                return next();
            }
        } 
        catch (err) {

            console.log("ERROR: " + err);

            return res.json({ data: null });
        }
    } 
    else {

        return res.json({ data: null, message: "You don't have an authorization" });
    }
};

helpers.isLoggedInAdmin = async (req, res, next) => {

    if (req.user.tipo_usuario === "S") {

        return next();
    } 
    else {

        return res.json({ data: null, message: "You are not a Admin" });
    }
};

helpers.completeUserData = async (req, res, next) => {

    const rows = await db.query(query.getUserData, [req.user.id]);

    if (rows[0].edad != null && rows[0].celular != null && rows[0].sexo != null && rows[0].ocupacion != null) {

        return next();
    } 
    else {

        return res.status(400).json({ data: null, message: "User Data Imcomplete" });
    }
};

helpers.userAlreadyRegistered = async (req, res, next) => {

    const { id } = req.params;

    const rows = await db.query(query.getUserId, [id, req.user.id]);

    if (rows < 1) {

        return next();
    }
    else {

        return res.json({ data: null, message: "User already registered" });
    }
};

module.exports = helpers;