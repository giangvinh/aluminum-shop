var express = require('express'), stylus = require('stylus')
    , nib = require('nib');

function compile(str, path) {
    return stylus(str)
        .set('filename', path)
        .use(nib())
}

var cors = require('cors');
var path = require('path');
var favicon = require('serve-favicon');
var express_logger = require('morgan');
var bodyParser = require('body-parser');
var i18n = require('i18n');


var db = require('./databases/database');
var app = express();
var session = require('express-session');


var MySQLStore = require('express-mysql-session')(session);
i18n.configure({
    locales: ['vi', 'en'],
    directory: __dirname + '/locales',
    defaultLocale: 'vi',
    cookie: 'i18n'
});
app.use(i18n.init);

// View engine setup
app.set('view engine', 'pug');
app.use(favicon(path.join(__dirname, '/dist/img/favicon.png')));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(express.static(path.join(__dirname, 'dist')));


var config = require('./config.json');

// var options = {
//     host: 'localhost',
//     port: 3306,
//     user: 'operamart',
//     password: 'mx5e3eDOM3Ps1Siy',
//     database: 'operamart',
//     checkExpirationInterval: 30000, // 30 seconds
//     socketPath: '/Applications/MAMP/tmp/mysql/mysql.sock',
//     expiration: 1800000, // 30 minutes
//     schema: {
//         tableName: 'omWebSessions',
//         columnNames: {
//             session_id: 'session_id',
//             expires: 'expires',
//             data: 'data'
//         }
//     }
// };

var dbconfig = require('./'+config.db_config_name);


var options = {
    host: dbconfig.database_host,
    port: dbconfig.database_port,
    user: dbconfig.database_username,
    password: dbconfig.database_password,
    database: dbconfig.database_name,
    checkExpirationInterval: 30000, // 30 seconds
    expiration: 1800000, // 30 minutes
    schema: {
        tableName: 'omWebSessions',
        columnNames: {
            session_id: 'session_id',
            expires: 'expires',
            data: 'data'
        }
    }
};

var sessionStore = new MySQLStore(options);
app.use(session({
    secret: "eTd=fQ!&#g9@9G56XJa4P+rKd%!33b5h+DNA&!M_",
    store: sessionStore,
    resave: false,
    saveUninitialized: true
}));

// Enable All CORS Requests
app.use(cors());
app.use(stylus.middleware(
    {
        src: __dirname + '/dist',
        compile: compile
    }
));


// Uncomment after placing your favicon in /public
app.use(express_logger('dev'));
app.use(express.static(path.join(__dirname, 'dist')));
app.use("/upload", express.static(path.join(__dirname, 'upload')));

// Make miner data accessible to the router
app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");



    if (req.session.locale == null) {
        req.session.locale = "vi";
    }
    res.setLocale(req.session.locale);

    next();
});
app.locals.moment = require('moment-timezone');
app.locals.moment.tz.setDefault("Asia/Ho_Chi_Minh");


app.use(bodyParser.urlencoded({extended: true}));

var app_routes = require('./app_routes');
app_routes.applyRoutes(app);


// Catch 404 and forward to error handler
app.use(function (req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// Error handlers
// Development error handler will print stacktrace
if (app.get('env') === 'development') {
    app.use(function (err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

// Production error handler, no stacktraces leaked to user
app.use(function (err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});

module.exports = app;

var fs = require("fs");

var moment = require('moment-timezone');
require("moment-duration-format");
moment.tz.setDefault("Asia/Ho_Chi_Minh");
var http = require('http').Server(app);
var https = require('https');
var io = require('socket.io')(http);



var ip = require('ip');
var push = require('./push/push');
var db = require('./databases/database');
var crypto = require('crypto');
var rig_state = require('./working_status');
var rig_show_mode = require('./show_mode');
var problem_code = require('./problem_code');


// --------------- BOOT ---------------



var log4js = require('log4js');
var logger = log4js.getLogger();
logger.setLevel(config.log_level ? config.log_level : 'INFO');

logger.warn('App: booting');





app.set('io', io);
io.on('connection', function(socket){
    app.set('socket', socket);

    console.log("Connect socket");
    socket.on('notification', function (data) {
        // we tell the client to execute 'new message'

    });
    socket.on('update_user_socket', function (user_id,socket_id) {
        db.updateUserSocket(user_id,socket_id,function (e, a) {
            if(e){
                console.log("Cập nhật socket cho user "+user_id+" thất bại");
                return;
            }
            console.log("Đã cập nhật socket "+socket_id+" cho user "+user_id);
        })

    });

});
io.listen(dbconfig.listen_socket);
http.listen(dbconfig.listen_port, function() {
    logger.info('App: listening on ' + ip.address() + ':' + dbconfig.listen_port);
});
app.listen(process.env.PORT);



