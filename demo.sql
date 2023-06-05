DROP DATABASE IF EXISTS ban_hang; -- xóa cơ sở duwxlieuej ban_hang nếu tồn tại nó
-- tạo mới cơ sở dữ liệu tên là ban_hang
CREATE DATABASE ban_hang DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
-- sử dụng cơ sở dữ liệu bán hàng để bắt đầu tạo bảng và thêm mói dữ liệu các bảng
use ban_hang;

-- tạo bảng category
CREATE TABLE IF NOT EXISTS category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL UNIQUE,
  status tinyint DEFAULT '1',
  created_at date DEFAULT current_timestamp()
);

-- tạo mới bảng product
CREATE TABLE IF NOT EXISTS product
(
    id int primary key AUTO_INCREMENT,
    name VARCHAR(150) not null UNIQUE,
    price float NOT NULL,
    sale_price float NULL DEFAULT '0',
    image VARCHAR(200) NULL,
    content text null,
    category_id int NOT NULL,
    created_at date DEFAULT current_timestamp(),
    FOREIGN KEY (category_id) REFERENCES category(id) -- kháo ngoại
);
-- thêm mới dữ liệu bảng category
INSERT INTO category(name) VALUES
('Áo nam'),
('Áo nữ'),
('Quần Bò'),
('Túi xách');

INSERT INTO category SET name='Ví da', status = 0;
INSERT INTO category SET name='Giây lưng', status = 0;
INSERT INTO category SET name='Áo bà ba', status = 0;
INSERT INTO category SET name='Áo đàm', status = 0;
INSERT INTO category SET name='Áo xóa', status = 0;
INSERT INTO category SET name='Quần áo', status = 0;

INSERT INTO product(name, price, sale_price, category_id) VALUES
('Áo sơ mi nam công sở', 250000, 200000, 1),
('Áo sơ mi nữ công sở', 250000, 200000, 2),
('Quần jeans nam Aristino AJN00109', 750000, 525000, 3),
('Quần Jeans Nam SlimFit Dáng Ôm Co Giãn', 530000, 350000, 3);

INSERT INTO product(name, price, sale_price, category_id) VALUES
('Áo đầm dạ hội mùa hè 2023', 250000, 200000, 9),
('Áo bà ba quê mùa em không mặc', 250000, 200000, 7)

-- truy vấn xữ liệu
SELECT * FROM category;
SELECT id, name FROM category;
SELECT * FROM product;
-- truy vẫn nhiều bảng với cách liệt kê
SELECT 
  product.id,
  product.name,
  category.name as category_name,
  product.price,
  product.sale_price,
  product.image,
  product.created_at
FROM category, product WHERE category.id = product.category_id;

-- truy vẫn nhiều bảng với join
SELECT 
  product.id,
  product.name,
  category.name as category_name,
  product.price,
  product.sale_price,
  product.image,
  product.created_at
FROM product 
INNER JOIN category ON category.id = product.category_id;

SELECT 
  product.id,
  product.name,
  category.name as category_name,
  product.price,
  product.sale_price,
  product.image,
  product.created_at
FROM category 
RIGHT JOIN product ON category.id = product.category_id;


SELECT 
      category.id,
      category.name,
      category.status,
      COUNT(product.id) as total_product
FROM category
LEFT JOIN product ON product.category_id = category.id
GROUP By category.id

-- SELECT cot1, cot2,..... FROM ten_bang WHERE condition
SELECT * FROM category WHERE id = 1;
SELECT * FROM category WHERE id >= 3 AND status = 0;
SELECT * FROM category WHERE id >= 2 AND id <= 5;
SELECT * FROM category WHERE id BETWEEN 2 AND 5;
SELECT * FROM category WHERE id IN(1,3,6);
SELECT * FROM category WHERE id NOT IN(1,3,6);
SELECT * FROM category WHERE name ='Áo nam' OR name = 'Áo nữ';
SELECT * FROM category WHERE name LIKE '%Áo%';

SELECT category_id FROM product;

SELECT * FROM category WHERE id NOT IN(SELECT category_id FROM product);

SELECT * FROM product ORDER BY price ASC;
SELECT * FROM product ORDER BY price DESC;

-- tuần tự các thành phần trong câu lệnh select

SELECT cot1, cot2,..... 
FROM ten_bang 
WHERE condition
GROUP BY cot1, cot2,.....
HAVING condition
ORDER BY cot1 ASC | DESC
LIMIT start, limit

SELECT * FROM product LIMIT 0, 2;
SELECT * FROM product LIMIT 2, 2;
SELECT * FROM product LIMIT 4, 2;
SELECT * FROM product LIMIT 6, 2;

-- xóa
DELETE FROM category WHERE id = 10
DELETE FROM product WHERE id = 10
-- cập nhật
UPDATE category SET name='Ví da 123', status = 0 WHERE id =10
