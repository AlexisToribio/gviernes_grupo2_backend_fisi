const express = require("express");
const routes = require("./routes");
const cors = require("cors");

//INITIALIZATIONS
const app = express();
app.use(cors({ origin: "*" }));
app.use(express.json());

//ROUTES


//EXPORTING
module.exports = app;