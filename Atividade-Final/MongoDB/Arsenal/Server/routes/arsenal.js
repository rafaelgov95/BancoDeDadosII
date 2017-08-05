var express = require('express');
var router = express.Router();
// const model = require('../modules/genericModel')(require('../modules/schema/schema-login'), 'arsenal')

const callback = (err, data, res) => {
  if (err) return console.log('erro', err)
  console.log("deu certo");
  res.json(data);
}

router.get('/', function (req, res, next) {
  res.send('respond with a resource');
});
router.post('/', function (req, res, next) {
  res.send(req.body);

});

router.post('/arsenal/save', function (req, res, next) {
  const body = req.body;
  console.log(body);
  var modelo = new model(body);
  modelo.save((err, data) => {
    callback(err, data, res)
  });
});

module.exports = router;
