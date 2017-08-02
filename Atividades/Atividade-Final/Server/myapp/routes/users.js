var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send('respond with a resource');
});
router.get('/rafael', function (req, res, next) {
  res.send('Ola mundo');
}).post('/rafael', (req, res, next) => {

}).then(function (response) {
  res.json(req.body);

}).catch((err) => {
  res.send("Ouve um erro")
});



module.exports = router;