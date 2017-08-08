var express = require('express');
var router = express.Router();
var mongodb = require('mongoose');
var model = mongodb.model('users', require('../../Mongoose-Schema/schema-login'));


const callback = (err, data, res) => {
  if (err) return console.log('erro', err)
  res.json(data)
}
/* GET home page. */
router.get('/', function (req, res, next) {
  model.find({}, (err, data) => {
     console.log(data)
     res.render('index', { data: data });
  });
});

module.exports = router;
