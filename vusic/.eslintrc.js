module.exports = {
  root: true,
  env: {
    es6: true,
    node: true,
  },
  parserOptions: {
    ecmaVersion: 2018, // Supports ES6+ syntax
    sourceType: "module",
  },
  extends: [
    "eslint:recommended",
    "google",
  ],
  rules: {
    "quotes": ["error", "double"],
    "max-len": ["error", {"code": 120, "ignoreComments": true}],
    // "no-unused-vars": ["error", {"argsIgnorePattern": "^_"}],
    "no-unused-vars": "off",
  },
};

