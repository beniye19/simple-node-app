"use strict";

const express = require("express");
const app = express();

const port = 3000;
const host = "0.0.0.0";

app.get("/", (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Hello World 🎉</title>
      <style>
        body {
          display: flex;
          justify-content: center;
          align-items: center;
          height: 100vh;
          background-color: #282c34;
          color: white;
          font-family: Arial, sans-serif;
          text-align: center;
        }
        .container {
          padding: 20px;
          border-radius: 10px;
          background: rgba(0, 0, 0, 0.2);
          box-shadow: 0px 0px 15px rgba(255, 255, 255, 0.3);
        }
        h1 {
          font-size: 3rem;
          margin-bottom: 10px;
        }
        p {
          font-size: 1.5rem;
        }
      </style>