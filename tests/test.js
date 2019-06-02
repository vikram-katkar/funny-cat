//Require the dev-dependencies
let chai = require("chai");
let chaiHttp = require("chai-http");
let app = require("../app").default;
let should = chai.should();

chai.use(chaiHttp);
//Our parent block
describe("Funny Cat", () => {
  describe("/GET", () => {
    it("it should GET index page", done => {
      chai
        .request(app)
        .get("/")
        .end((err, res) => {
          res.should.have.status(200);
          done();
        });
    });

    it("it should GET test string", done => {
        chai
          .request(app)
          .get("/test")
          .end((err, res) => {
            res.should.have.status(200);
            res.text.should.be.eql('Hello World!');
            done();
          });
      });
  });
});
