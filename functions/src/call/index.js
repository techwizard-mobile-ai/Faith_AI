const {onRequest} = require("firebase-functions/v2/https");
const {getVoiceLists} = require("./core");
const {createMessage} = require("./core");

exports.getVoices = onRequest(async (req, res) => {
  const lists = await getVoiceLists();
  res.status(200).send(lists);
});

exports.generateVoice = onRequest(async (req, res) => {
  const stream = await createMessage();
  res.setHeader("Content-Type", "audio/mpeg");
  stream.pipe(res);
});
