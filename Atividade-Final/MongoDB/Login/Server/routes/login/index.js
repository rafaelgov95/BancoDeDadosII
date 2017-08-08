
'use strict'
var express = require('express');
var jwt = require('jsonwebtoken')
var mongodb = require('mongoose');
var segredo = 'seusegredodetoken'
var app = express();
var model = mongodb.model('users', require('../../../Mongoose-Schema/schema-login'));
var router = express.Router();

app.set('superNode-auth', 'node-auth');

const callback = (err, data, res) => {
  if (err) return console.log('erro', err)
  res.json(data)
}

router.get('/listar', (req, res, next) => {
  model.find({}, (err, data) => {
    callback(err, data, res)
  });
});

router.post('/buscar', (req, res, next) => {
  const body = req.body;
  model.find(body, (err, data) => {
    callback(err, data, res)
  });
});

router.post('/criar', (req, res, next) => {
  const body = req.body;
  var modelo = new model(body);
  modelo.save((err, data) => {
    callback(err, data, res)
  });
});

router.post('/logar', (req, res, next) => {
  var email = req.body.email || '';
  var passwd = req.body.passwd || '';
  if (email == '' || passwd == '') {
    return res.sendStatus(401);
  };
  model.findOne({ email: email }, function (err, user) {
    if (err || user == null) {
      return res.sendStatus(401)
    }
    user.verifica_passwd(passwd, function (isMatch) {
      if (!isMatch) {
        return res.sendStatus(401);
      }
      var token = jwt.sign(user, app.get('superNode-auth'), {
        expiresIn: 60 * 60 * 24 //o token irá expirar em 24 horas
      });
      console.log(token);
      user.accessToken = token;
      user.save((err, data) => {
        if (err) return console.log('erro', err)
        res.json({
          user: user.toJSON()
        });

      });


    });
  });

});

router.post('/delete', (req, res, next) => {
  const body = req.body;
  model.remove(body, (err, data) => {
    callback(err, data, res)
  });

});

module.exports = router;
