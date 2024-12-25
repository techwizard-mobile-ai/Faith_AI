const {logger} = require("firebase-functions");
const {createClient} = require("./utils");

const getVoiceLists = async () => {
  const client = await createClient();
  const voices = await client.voices.getAll();
  return voices;
};

const createMessage = async (msg) => {
  const client = await createClient();
  try {
    logger.info(msg);
    const audio = await client.generate({
      stream: true,
      voice: "Sarah",
      text: msg,
      model_id: "eleven_multilingual_v2",
    });
    logger.info(audio);
    return audio;
  } catch (e) {
    logger.error(e);
    return null;
  }
};

module.exports = {
  getVoiceLists,
  createMessage,
};
