const mysql = require('mysql');

const ketnoi = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password:'',
    database: 'ban_hang'
});

ketnoi.connect(function (err) { 
    if (err) {
        console.log('Kết nối CSDL ko thành công, kiểm tra lại CSDL')
    }
});

module.exports = ketnoi;
