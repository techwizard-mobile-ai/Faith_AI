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

const chatFunctions = require("./src/chat");
// const functions = require("firebase-functions");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

exports.helloWorld = onRequest((request, response) => {
  logger.info(request, {structuredData: true});
  logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});

// exports.normalFaith
// Chatting for the normal User
// exports.normalfaith = onRequest(async (req, res) => {
//   sendRequest(req.body.text, process.env.PMP_TOPIC)
//       .then((resp) => {
//         resp.json().then((data) => {
//           res.send(data.content[0].text);
//         });
//       })
//       .catch((e) => {
//         logger.error(e, {structuredData: true});
//         res.send(e);
//       });
// });

// // This is the core function of the request to the claude ai api.
// const sendRequest = (text, prompt) => {
//   return new Promise((resolve, reject) => {
//     fetch(process.env.BASE_URL, {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/json",
//         "x-api-key": process.env.API_KEY,
//         "anthropic-version": "2023-06-01",
//       },
//       body: JSON.stringify({
//         model: "claude-3-5-sonnet-20241022",
//         max_tokens: 1000,
//         temperature: 0,
//         system: prompt,
//         messages: [
//           {
//             role: "user",
//             content: [
//               {
//                 type: "text",
//                 text: text,
//               },
//             ],
//           },
//         ],
//       }),
//     })
//         .then((resp) => {
//           resolve(resp);
//         })
//         .catch((e) => {
//           reject(e);
//         });
//   });
// };

// Text Function for the Claude API
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

module.exports = {
  ...chatFunctions,
};
