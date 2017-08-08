var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Olá sou o MongoDB, junto do meu primo Mongoose venha me estudar !!!' });
});

module.exports = router;
