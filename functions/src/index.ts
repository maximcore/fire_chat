import * as admin from 'firebase-admin';
import * as functions from "firebase-functions";

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

admin.initializeApp();

exports.sortUsers = functions.firestore.document('posts').onCreate((_, __) => sortUsers2());

async function sortUsers2() {
    const firestore = admin.firestore();
try {

const collection = await firestore.collection('posts').get();
console.log({
collection
})

;}
catch (error) {
    console.log(error);
}
}
