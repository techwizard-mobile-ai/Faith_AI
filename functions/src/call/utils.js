const {ElevenLabsClient} = require("elevenlabs");
const createClient = async () => {
  let client;
  const ELEVENLABS_KEY = process.env.ELEVEN_API_KEY;
  if (!client) {
    client = new ElevenLabsClient({
      apiKey: ELEVENLABS_KEY,
    });
  }
  return client;
};

module.exports = {
  createClient,
};
