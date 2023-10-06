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

const removeUserFromAlgolia = functions.region("us-east4").firestore.document("users/{userId}").onDelete(
    async (snapshot, context) => {
        // Get the Firestore ID for the user
        const objectId = snapshot.id;

        // Remove the user from the Algolia index
        await index.deleteObject(objectId);

        return {message: "User removed from Algolia successfully!"};
    },
);

module.exports = removeUserFromAlgolia;
