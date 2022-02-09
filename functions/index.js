const functions = require("firebase-functions");
const admin = require("firebase-admin")

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//


 exports.helloWorld = functions.https.onRequest((request, response) => {
   functions.logger.info("Hello logs!", {structuredData: true});
   response.send("Hello from Firebase!");
 });

// exports.addUser = functions.region('europe-west3').https.onRequest(async (request, response) => {
// const original = request.query.text;
// const writeResult = await admin.firestore().collection("posts").add({
//  description: 2, username: "maxim"
// });
// response.status(200).json({result: 'ok'});
// });

