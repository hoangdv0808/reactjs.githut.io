const express = require('express')
const ketnoi = require('./connect-mysql');
const app = express();
const PORT = process.env.PORT || 3000;
app.use(express.static('public'));
app.set('view engine', 'ejs');

app.get('', function(req, res) {
    res.render('index');
});


app.get('/category', function(req, res) {
    ketnoi.query("SELECT * FROM category", function(err, data) {
        if (err) {
            console.log(err.sqlMessage);
        } else {
            res.render('category', {
                categores: data
            });
        }
    });
    
});

app.get('/category/add', function(req, res) {
    res.render('category-add');
});


app.get('/category/edit/:id', function(req, res) {
    res.render('category-edit');
});


app.get('/product', function(req, res) {
    res.render('product');
});

app.listen(PORT, function() {
    console.log('Máy chủ mở cổng http://localhost:3000')
});

