create table sales(id INT,name VARCHAR(50),category VARCHAR(50),price INT,quantity
INT,sale_date DATE);


insert into sales values(1, 'Laptop', 'Electronics', 800, 2, '2025-01-01'),
(2, 'Phone', 'Electronics', 600, 3, '2025-01-01'),(3, 'TV', 'Electronics', 900, 1, '2025-01-02'),
(4, 'Headphones', 'Electronics', 150, 5, '2025-01-03'),(5, 'Table', 'Furniture', 300, 1, '2025-01-01'),(
6, 'Chair', 'Furniture', 100, 4, '2025-01-02'),(7, 'Sofa', 'Furniture', 1200, 1, '2025-01-03'),
(8, 'Bed', 'Furniture', 900, 1, '2025-01-04'),(9, 'T-shirt', 'Clothing', 40, 6, '2025-01-01'),(
10, 'Jeans', 'Clothing', 70, 3, '2025-01-02'),(11, 'Jacket', 'Clothing', 120, 2, '2025-01-03'),
(12, 'Shoes', 'Clothing', 90, 4, '2025-01-04'),(13, 'Apple', 'Food', 2, 20, '2025-01-01'),
(14, 'Bread', 'Food', 3, 15, '2025-01-02'),(15, 'Milk', 'Food', 4, 10, '2025-01-03'),
(16, 'Cheese', 'Food', 8, 5, '2025-01-04'),(17, 'Notebook', 'Stationery', 5, 10, '2025-01-01'),
(18, 'Pen', 'Stationery', 2, 25, '2025-01-02'),(19, 'Marker', 'Stationery', 4, 12, '2025-01-03'),
(20, 'Folder', 'Stationery', 6, 8, '2025-01-04');


select category, sum(quantity) as total from sales group by category;
+-------------+-------+
| category    | total |
+-------------+-------+
| Electronics |    11 |
| Furniture   |     7 |
| Clothing    |    15 |
| Food        |    50 |
| Stationery  |    55 |
+-------------+-------+


select category, sum(price*quantity) as total from sales group by category;
+-------------+-------+
| category    | total |
+-------------+-------+
| Electronics |  5050 |
| Furniture   |  2800 |
| Clothing    |  1050 |
| Food        |   165 |
| Stationery  |   196 |
+-------------+-------+


select category, avg(price) as average from sales group by category;
+-------------+----------+
| category    | average  |
+-------------+----------+
| Electronics | 612.5000 |
| Furniture   | 625.0000 |
| Clothing    |  80.0000 |
| Food        |   4.2500 |
| Stationery  |   4.2500 |
+-------------+----------+


select sale_date, sum(price*quantity) as total from sales group by sale_date;
+------------+-------+
| sale_date  | total |
+------------+-------+
| 2025-01-01 |  4030 |
| 2025-01-02 |  1605 |
| 2025-01-03 |  2278 |
| 2025-01-04 |  1348 |
+------------+-------+


select sum(price*quantity) as Electronics from sales where categor
y = "Electronics";
+-------------+
| Electronics |
+-------------+
|        5050 |
+-------------+


select category, sum(price*quantity) from sales group by category having sum(price*quantity) > 200;
+-------------+---------------------+
| category    | sum(price*quantity) |
+-------------+---------------------+
| Electronics |                5050 |
| Furniture   |                2800 |
| Clothing    |                1050 |
+-------------+---------------------+


select category, Avg(price) as average from sales group by category having avg(price) > 100;
+-------------+----------+
| category    | average  |
+-------------+----------+
| Electronics | 612.5000 |
| Furniture   | 625.0000 |
+-------------+----------+


select sum(quantity) as sold from sales where sale_date = "2025-01-01";
+------+
| sold |
+------+
|   42 |
+------+


select category, sum(quantity) as Sold from sales group by category order by Sold desc limit 1;
+------------+------+
| category   | Sold |
+------------+------+
| Stationery |   55 |
+------------+------+


select category, sum(price*quantity) as total from sales where quantity > 3 group by category;
+-------------+-------+
| category    | total |
+-------------+-------+
| Electronics |   750 |
| Furniture   |   400 |
| Clothing    |   600 |
| Food        |   165 |
| Stationery  |   196 |
+-------------+-------+