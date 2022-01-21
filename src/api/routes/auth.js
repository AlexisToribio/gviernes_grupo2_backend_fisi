const { Router } = require("express");
const { isLoggedIn } = require("../middlewares/helpers");
const userController = require("../controllers/user");

//INITIALIZATION
const router = Router();

router.get("/user", isLoggedIn, userController.getProfile);
router.post("/login", userController.executeSignIn);
router.post("/signup", userController.executeSignUp);

module.exports = router;