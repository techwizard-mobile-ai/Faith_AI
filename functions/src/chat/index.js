const {onRequest} = require("firebase-functions/v2/https");
// const logger = require("firebase-functions/logger");
const {firstChat, sendRequest} = require("./utils");
const {logger} = require("firebase-functions");
const {CHRISTIAN_PROMPT} = require("./prompts");
exports.chat = onRequest(async (req, res) => {
  logger.info(typeof req.body.messages);
  let messages;
  if (req.body.messages != null) {
    messages = JSON.parse(req.body.messages).map((message) => {
      return {
        role: message.isBot ? "assistant" : "user",
        content: [
          {
            type: "text",
            text: message.messages[0],
          },
        ],
      };
    });
  }
  if (req.body.first == "true") {
    logger.info("First Chat");
    firstChat(messages, CHRISTIAN_PROMPT, req.body.id, res);
  } else {
    sendRequest(messages, CHRISTIAN_PROMPT)
        .then((resp) => {
          resp.json().then((data) => {
            logger.info(data);
            res.status(200).send({response: data.content[0].text});
          });
        })
        .catch((e) => {
          logger.error(e, {structuredData: true});
          res.status(500).send(e);
        });
  }
});
