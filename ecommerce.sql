CREATE TABLE brand (
  brand_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT
);

CREATE TABLE product_category (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT
);

CREATE TABLE product (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  brand_id INT,
  category_id INT,
  base_price DECIMAL(10,2),
  description TEXT,
  FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
  FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

CREATE TABLE product_item (
  item_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  sku VARCHAR(100) UNIQUE,
  stock_quantity INT,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE color (
  color_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  hex_code VARCHAR(7) 
);

CREATE TABLE size_category (
  size_cat_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE size_option (
  size_id INT AUTO_INCREMENT PRIMARY KEY,
  size_cat_id INT,
  label VARCHAR(10),
  FOREIGN KEY (size_cat_id) REFERENCES size_category(size_cat_id)
);

CREATE TABLE product_variation (
  variation_id INT AUTO_INCREMENT PRIMARY KEY,
  item_id INT,
  size_id INT,
  color_id INT,
  FOREIGN KEY (item_id) REFERENCES product_item(item_id),
  FOREIGN KEY (size_id) REFERENCES size_option(size_id),
  FOREIGN KEY (color_id) REFERENCES color(color_id)
);

CREATE TABLE product_image (
  image_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  image_url VARCHAR(255),
  alt_text VARCHAR(150),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE attribute_type (
  type_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50)  
);

CREATE TABLE attribute_category (
  attr_cat_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE product_attribute (
  attribute_id INT AUTO_INCREMENT PRIMARY KEY,
  item_id INT,
  attr_cat_id INT,
  type_id INT,
  name VARCHAR(100),
  value VARCHAR(255),
  FOREIGN KEY (item_id) REFERENCES product_item(item_id),
  FOREIGN KEY (attr_cat_id) REFERENCES attribute_category(attr_cat_id),
  FOREIGN KEY (type_id) REFERENCES attribute_type(type_id)
);

INSERT INTO brand (name, description) VALUES
('Nike', 'Sportswear and apparel'),
('Apple', 'Consumer electronics and software');

INSERT INTO product_category (name, description) VALUES
('Clothing', 'All types of wearable clothing'),
('Electronics', 'Gadgets and electronic devices');

INSERT INTO product (name, brand_id, category_id, base_price, description) VALUES
('iPhone 13', 2, 2, 999.99, 'Latest Apple iPhone'),
('Nike T-Shirt', 1, 1, 29.99, 'Comfortable cotton T-shirt');

INSERT INTO product_item (product_id, sku, stock_quantity) VALUES
(1, 'IP13-BLK-128', 50),
(2, 'NKTS-WHT-M', 100);

INSERT INTO color (name, hex_code) VALUES
('Black', '#000000'),
('White', '#FFFFFF');

INSERT INTO size_category (name) VALUES
('Clothing'),
('Mobile Storage');

INSERT INTO size_option (size_cat_id, label) VALUES
(1, 'M'),
(2, '128GB');

INSERT INTO product_variation (item_id, size_id, color_id) VALUES
(1, 2, 1),  -- iPhone 13, 128GB, Black
(2, 1, 2);  -- Nike T-Shirt, M, White

INSERT INTO product_image (product_id, image_url, alt_text) VALUES
(1, 'https://apple.com/images/iphone13.jpg', 'iPhone 13 Image'),
(2, 'https://nike.com/images/nike-shirt.jpg', 'Nike T-Shirt Image');

INSERT INTO attribute_type (name) VALUES
('Text'),
('Number'),
('Boolean');

INSERT INTO attribute_category (name) VALUES
('Technical'),
('Physical');

INSERT INTO product_attribute (item_id, attr_cat_id, type_id, name, value) VALUES
(1, 1, 2, 'Battery Life', '20'),     -- iPhone
(2, 2, 1, 'Material', 'Cotton');     -- T-Shirt


