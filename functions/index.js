/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
// const functions = require("firebase-functions");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

exports.helloWorld = onRequest((request, response) => {
  logger.info(request, {structuredData: true});
  logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});

exports.testBot = onRequest((request, response) => {
  logger.info("--------------------------------");
  logger.info("request", request);
  fetch(process.env.BASE_URL, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "x-api-key": process.env.API_KEY,
      "anthropic-version": "2023-06-01",
    },
    body: JSON.stringify({
      model: "claude-3-5-sonnet-20241022",
      max_tokens: 1000,
      temperature: 0,
      system: "You are a world-class poet. Respond only with short poems.",
      messages: [
        {
          role: "user",
          content: [
            {
              type: "text",
              text: "Why is the ocean salty?",
            },
          ],
        },
      ],
    }),
  })
      .then((res) => {
        logger.info("----------------------------------");
        res.json().then((data) => {
          logger.info(data.content[0].text, {structuredData: true});
          response.send(data.content[0].text);
        });
      })
      .catch((e) => {
        logger.error(e, {structuredData: true});
        response.send(e);
      });
});
