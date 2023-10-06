const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Initialize Firebase Admin SDK if not already initialized
if (!admin.apps.length) {
  admin.initializeApp();
}

// Import functions
const syncUserToAlgolia = require("./syncUserToAlgolia.js");
const removeUserFromAlgolia = require("./removeUserFromAlgolia.js");

// Export the function
exports.syncUserToAlgolia = syncUserToAlgolia;
exports.removeUserFromAlgolia = removeUserFromAlgolia;
