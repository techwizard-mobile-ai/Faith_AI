const {logger} = require("firebase-functions");
const {db} = require("../config/firebase");
const sendRequest = (text, prompt) => {
  return new Promise((resolve, reject) => {
    logger.info(prompt, text);
    fetch(process.env.BASE_URL, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "x-api-key": process.env.API_KEY,
        "anthropic-version": "2023-06-01",
      },
      body: JSON.stringify({
        model: "claude-3-5-sonnet-20241022",
        max_tokens: 1024,
        temperature: 0,
        system: prompt,
        messages: [
          {
            role: "user",
            content: [
              {
                type: "text",
                text: text,
              },
            ],
          },
        ],
      }),
    })
        .then((resp) => {
          logger.info(resp);
          resolve(resp);
        })
        .catch((e) => {
          reject(e);
        });
  });
};

// If this is user's first Chat then we need to get the topic and store it into the firestore.
const firstChat = async (text, userid, res) => {
  const Topic = await sendRequest(text, process.env.PMP_TOPIC).then((resp) => {
    return resp.json().then((data) => {
      return data.content[0].text;
    });
  });

  try {
    await db.collection("topics").add({
      topic: Topic,
      uid: userid,
      createdAt: new Date(),
    });
    const response = await sendRequest(text, "")
        .then((resp) => {
          return resp.json().then((data) => {
            return data.content[0].text;
          });
        })
        .catch((e) => {
          logger.error(e, {structuredData: true});
          res.status(500).send(e);
        });
    res.status(200).send(response);
  } catch (e) {
    logger.error(e, {structuredData: true});
    res.status(500).send(e);
  }
};
module.exports = {
  sendRequest,
  firstChat,
};
