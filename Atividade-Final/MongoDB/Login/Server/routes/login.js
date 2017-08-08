var express = require('express');
var router = express.Router();

const mongodb = require('mongoose');
const model = mongodb.model('users', require('../../Mongoose-Schema/schema-login'));


const callback = (err, data, res) => {
  if (err) return console.log('erro', err)
  res.json(data);
}

router.get('/listar', function (req, res, next) {
  model.find({}, (err, data) => {
    callback(err, data, res)
  });
});

router.post('/buscar', function (req, res, next) {
  const body = req.body;
  model.find(body, (err, data) => {
    callback(err, data, res)
  });
});

router.post('/criar', function (req, res, next) {
  const body = req.body;
  var modelo = new model(body);
  modelo.save((err, data) => {
    callback(err, data, res)
  });
});

router.post('/logar', function (req, res, next) {
  const body = req.body;
  modelo.find((err, data) => {
    callback(err, data, res)
  });
});
router.post('/delete', function (req, res, next) {
  const body = req.body;
  console.log(body)
  model.remove(body,(err, data) => {
    callback(err, data, res)
  });
});
module.exports = router;
