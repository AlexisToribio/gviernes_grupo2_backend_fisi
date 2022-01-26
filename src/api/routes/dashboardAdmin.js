const { isLoggedIn, isLoggedInAdmin } = require("../middlewares/helpers");
const { Router } = require("express");
const requestController = require("../controllers/request");
const eventController = require("../controllers/event");

const router = Router();

router.get(
    "/myrequests",
    isLoggedIn,
    isLoggedInAdmin,
    requestController.getRequestAdmin
);

router.get(
    "/myrequests/details/:id",
    isLoggedIn,
    isLoggedInAdmin,
    requestController.getRequestsDetailsAdmin
);

router.put(
    "/myrequests/details/approved/:id",
    isLoggedIn,
    isLoggedInAdmin,
    requestController.executeApprovedRequest
);

router.put(
    "/myrequests/details/dismissed/:id",
    isLoggedIn,
    isLoggedInAdmin,
    requestController.executeRejectedRequest
);

router.put(
    "/events/:id",
    isLoggedIn,
    isLoggedInAdmin,
    requestController.changeStatusToSlope
);

module.exports = router;