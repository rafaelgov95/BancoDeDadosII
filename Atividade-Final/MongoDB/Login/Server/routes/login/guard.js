'use strict'
var jwt = require('jsonwebtoken')
var express = require('express')
var app = express();
app.set('superNode-auth', 'node-auth');
module.exports = function(req, res, next) {

    var token = req.body.token || req.query.token || req.headers['x-access-token'];

    if (token) {
        jwt.verify(token, app.get('superNode-auth'), function(err, decoded) {
            if (err) {
                return res.json({ success: false, message: 'Falha ao tentar autenticar o token!' });
            } else {
                next();
            }
        });


    } else {
        return res.status(403).render('./../views/error.pug',{ 
            error:'Esse é o erro',
            error_dois:'Erro 2',
            success: false,
            message: 'Não há token.'
        });
    }
};