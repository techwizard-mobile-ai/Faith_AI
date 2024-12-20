const {onRequest} = require("firebase-functions/v2/https");
// const logger = require("firebase-functions/logger");
const {firstChat, sendRequest} = require("./utils");
const {logger} = require("firebase-functions");
exports.chat = onRequest(async (req, res) => {
  logger.info(req.body.first);
  if (req.body.first == "true") {
    logger.info("First Chat");
    firstChat(req.body.text, req.body.id, res);
  } else {
    sendRequest(req.body.text, process.env.PMP_UNIVERSAL)
        .then((resp) => {
          resp.json().then((data) => {
            logger.info(data);
            res.status(200).send(data.content[0].text);
          });
        })
        .catch((e) => {
          logger.error(e, {structuredData: true});
          res.status(500).send(e);
        });
  }
});
