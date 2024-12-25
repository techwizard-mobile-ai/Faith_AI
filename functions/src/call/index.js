const {onRequest} = require("firebase-functions/v2/https");
const {getVoiceLists} = require("./core");
// const {createMessage} = require("./core");
const {logger} = require("firebase-functions");
// const {sendRequest} = require("../chat/utils");
// const {CHRISTIAN_PROMPT} = require("../chat/prompts");

exports.getVoices = onRequest(async (req, res) => {
  const lists = await getVoiceLists();
  res.status(200).send(lists);
});

exports.generateVoice = onRequest(async (req, res) => {
  const botResponse = await fetch("https://chat-nulrzzis2a-uc.a.run.app", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: {
      messages: [
        {
          role: "user",
          content: req.body.message,
        },
      ],
      first: req.body.historyid == "null",
      id: req.body.id,
    },
  });
  logger.info(botResponse);
  // sendRequest(
  //     [{role: "user", content: req.body.message}],
  //     CHRISTIAN_PROMPT,
  // ).then(async (resp) => {
  //   resp.json().then(async (data) => {
  //     logger.info(data);
  //     logger.info(data.content[0].text);
  //     const stream = await createMessage(data.content[0].text);
  //     res.setHeader("Content-Type", "audio/mpeg");
  //     res.setHeader("historyID", "TEST");
  //     stream.pipe(res);
  //   });
  // });
});
