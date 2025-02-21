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