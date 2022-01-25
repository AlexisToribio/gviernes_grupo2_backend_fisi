require("dotenv").config();
const { PORT } = require("./config");
const app = require("./api");

//FUNCTION THAT START THE SERVER
async function startServer() {

    await app.listen(PORT, () => {

        console.log(`Server running on localhost:${PORT}`)
    })
    .on("error", (err) => {

        console.log(err);
    });
}

//RUNNING SERVER
startServer();