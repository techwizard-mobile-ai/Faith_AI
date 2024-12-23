const {logger} = require("firebase-functions");
const {createClient} = require("./utils");

const getVoiceLists = async () => {
  const client = await createClient();
  const voices = await client.voices.getAll();
  return voices;
};

const createMessage = async () => {
  const client = await createClient();
  const audio = await client.generate({
    stream: true,
    voice: "Sarah",
    text: "Hi Nice to meet you, this is for testing bot, so just say loudly and long.Hi Nice to meet you, this is for testing bot, so just say loudly and long.Hi Nice to meet you, this is for testing bot, so just say loudly and long.Hi Nice to meet you, this is for testing bot, so just say loudly and long.Hi Nice to meet you, this is for testing bot, so just say loudly and long.Hi Nice to meet you, this is for testing bot, so just say loudly and long.",
    model_id: "eleven_multilingual_v2",
  });
  logger.info(audio);
  return audio;
};

module.exports = {
  getVoiceLists,
  createMessage,
};
