const express = require("express");
const routes = require("./routes");
const cors = require("cors");

//INITIALIZATIONS
const app = express();
app.use(cors({ origin: "*" }));
app.use(express.json());

//ROUTES
app.use(routes);

//EXPORTING
module.exports = app;