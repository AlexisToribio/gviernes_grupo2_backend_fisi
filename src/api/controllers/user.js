const db = require("../../database/index");
const helpers = require("../middlewares/helpers");
const { SECRET_TOKEN } = require("../../config");
const jwt = require("jsonwebtoken");
const query = require("../../database/querys/user");

module.exports = {
  getProfile: (req, res) => {
    if (req.user) {
      return res.status(200).json({ data: req.user, message: "Data profile" });
    } else {
      return res.status(400).json({ data: null, message: "Invalid token" });
    }
  },
  updateUser: async (req, res) => {
    const { id } = req.params;

    const { nombres, apellidos, email, edad, celular, sexo, ocupacion, foto } =
      req.body;

    const newUser = {
      nombres,
      apellidos,
      email,
      edad,
      celular,
      sexo,
      ocupacion,
      foto,
    };

    await db.query(query.updateUser, [newUser, id], (err, result) => {
      if (err) {
        return res
          .status(500)
          .json({ data: null, message: "Error when updating the user data" });
      } else {
        return res
          .status(200)
          .json({ data: null, message: "Update was successful" });
      }
    });
  },
  executeSignIn: async (req, res) => {
    const { email, password } = req.body;

    const rows = await db.query(query.getUser, [email]);

    if (rows.length > 0) {
      const user = rows[0];

      const validate = await helpers.matchPassword(password, user.password);

      if (validate) {
        const { nombres, apellidos, foto, tipo_usuario } = user;

        const token = jwt.sign({ id: user.id }, SECRET_TOKEN);

        return res.json({
          token,
          user: { nombres, apellidos, foto, tipo_usuario },
          message: "Login successful",
        });
      } else {
        res
          .status(400)
          .json({ data: null, message: "Your password is incorrect" });
      }
    } else {
      res.status(400).json({ data: null, message: "Your email is not exists" });
    }
  },
  executeSignUp: async (req, res) => {
    const { nombres, apellidos, email, password } = req.body;

    const newUser = { nombres, apellidos, email, password };

    newUser.password = await helpers.encryptPassword(password);

    await db.query(query.insertUser, [newUser], (err, result) => {
      if (err) {
        return res.json({ data: null, message: err });
      } else {
        return res
          .status(200)
          .json({ data: null, message: "Register was successful" });
      }
    });
  },
};
