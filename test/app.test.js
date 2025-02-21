const request = require("supertest");
const app = require("../app");

describe("GET /", function () {
  it("should return HTML content with 'Hello, World!'", function (done) {
    request(app)
      .get("/")
      .expect("Content-Type", /html/)
      .expect(200)
      .expect((res) => {
        if (!res.text.includes("Hello, World!")) {
          throw new Error("Response does not contain 'Hello, World!'");
        }
      })
      .end(done);
  });
});