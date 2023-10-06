const functions = require("firebase-functions");
const admin = require("firebase-admin");
const algoliasearch = require("algoliasearch");

// Retrieve Algolia configuration from Firebase environment variables
const ALGOLIA_APP_ID = functions.config().algolia.app_id;
const ALGOLIA_ADMIN_KEY = functions.config().algolia.admin_key;
const ALGOLIA_INDEX_NAME = "users";

// Set up Algolia client and index
const client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);
const index = client.initIndex(ALGOLIA_INDEX_NAME);

const syncUserToAlgolia = functions.region("us-east4").firestore.document("users/{userId}").onCreate(
    async (snapshot, context) => {
    // Get the user data from the snapshot
      const data = snapshot.data();

      // Check if data exists
      if (!data) {
        throw new functions.https.HttpsError("invalid-argument", "User data is required");
      }

      // Get the Firestore ID for the user
      const objectId = snapshot.id;

      // Add an 'objectID' field which Algolia requires
      data.objectID = objectId;

      // Add the new user to the Algolia index
      await index.saveObject(data);

      return {message: "User added to Algolia successfully!"};
    },
);

module.exports = syncUserToAlgolia;
