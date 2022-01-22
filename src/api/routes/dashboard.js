const { isLoggedIn, completeUserData, userAlreadyRegistered } = require("../middlewares/helpers");
const { Router } = require("express");
const eventsController = require("../controllers/event");
const userController = require("../controllers/user");
const requestController = require("../controllers/request");

const router = Router();

router.get("/profile", isLoggedIn, userController.getProfile);

router.put("/profile/:id", isLoggedIn, userController.updateUser);

router.get("/events", isLoggedIn, eventsController.getEvents);

router.get("/events/details/:id", isLoggedIn, eventsController.getEventDetails);

router.post(
    "/events/inscription/:id",
    isLoggedIn,
    completeUserData,
    userAlreadyRegistered,
    eventsController.executeInscription
);

router.post(
    "/events/register",
    isLoggedIn,
    eventsController.executeEventRegister
);

router.get("/myevents", isLoggedIn, eventsController.getMyEvents);

router.get("/myrequests", isLoggedIn, requestController.getMyRequests);

router.get(
    "/myrequests/details/:id",
    isLoggedIn,
    requestController.getMyRequestsDetails
);

module.exports = router;