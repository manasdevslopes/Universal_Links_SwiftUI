const express = require("express");
const path = require("path");

const server = express();

// server.get("/apple-app-site-association", function (req, res) {
//   res.sendFile(path.join(__dirname, "/apple-app-site-association"));
// });

// // handle invite link
// server.get("/invite", function (req, res) {
//   res.sendFile(path.join(__dirname, "index.html"));
// });

// // optional: handle /invite/*
// server.get("/invite/*", function (req, res) {
//   res.sendFile(path.join(__dirname, "index.html"));
// });

// server.get("/", function (req, res) {
//   res.sendFile(path.join(__dirname, "index.html"));
// });

// server.listen(80, () => {
//   console.log("Server running on port 80");
// });
// // 3000

// AASA file
server.get("/.well-known/apple-app-site-association", (req, res) => {
  res.sendFile(path.join(__dirname, "apple-app-site-association"));
});

// invite link
server.get(/^\/invite\/?.*/, (req, res) => {
  res.sendFile(path.join(__dirname, "index.html"));
});

// home
server.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "index.html"));
});

server.listen(3000, () => {
  console.log("Server running on port 3000");
});

// https://pete-juridical-reggie.ngrok-free.dev/apple-app-site-association
// xcrun simctl openurl booted https://pete-juridical-reggie.ngrok-free.dev/invite?code=ABC123
// applinks:pete-juridical-reggie.ngrok-free.dev
// node index.js
// ngrok http 80
// ngrok http 3000
