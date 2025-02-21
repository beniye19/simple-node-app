const request = require("supertest");
const app = require("../app");

describe("GET /", function () {
  it("should return HTML content with 'Hello, World!'", function (done) {