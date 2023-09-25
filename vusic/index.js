const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Initialize Firebase Admin SDK if not already initialized
if (!admin.apps.length) {
  admin.initializeApp();
}

// Import the syncUserToAlgolia function
const syncUserToAlgolia = require("./syncUserToAlgolia");

// Export the function
exports.syncUserToAlgolia = syncUserToAlgolia;
