const auth = require("./auth")
const dashboard = require("./dashboard")
const express = require("express")
const router = express.Router()


//ROUTES
router.use("/auth", auth)
router.use("/dashboard", dashboard)


//EXPORT
module.exports = router