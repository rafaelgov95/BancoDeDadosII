const mg = require('mongoose')
var bcrypt = require('bcrypt-nodejs');

const login_schema = new mg.Schema({
    email: String,
    passwd: String,
    accessToken: { type: String },
})


login_schema.pre('save', function(next) {
    var user = this;
    if (!user.isModified('passwd')) return next();
    bcrypt.genSalt(5, function(err, salt) {
        if (err) return next(err);
        bcrypt.hash(user.passwd, salt, null, function(err, hash) {
            if (err) return next(err);
            user.passwd = hash;
            next();
        });
    });
});

login_schema.methods.verifica_passwd = function(passwd, next) {
    bcrypt.compare(passwd, this.passwd, function(err, isMatch) {
        if (err) return next(err);
        next(isMatch);
    });
};

// login_schema.methods.verifica_token = function(token, next) {
//     this.accessToken=token;
//     next(true)
// };

login_schema.statics.save_token = function(err,cb) {
    console.log('entro aqui')
  return this.save({ accessToken: accessToken }, cb);
};

module.exports = login_schema;