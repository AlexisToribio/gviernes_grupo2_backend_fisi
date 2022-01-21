const auth = require("./auth")
const express = require("express")
const router = express.Router()


//ROUTES
router.use("/auth", auth)


//EXPORT
module.exports = router