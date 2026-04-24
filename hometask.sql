insert into computers values('Apple', 'MacBook Air M2', 'M2', 3.5, 8, 'macOS', 1800),
('ASUS', 'ZenBook 14', 'Intel Core i7', 3.9, 16, 'Windows 10', 1500),('ASUS', 'ROG Strix', 'AMD Ryzen 7', 4.0, 16, 'Windows 11', 2000),('HP', 'Pavilion 15', 'Intel Core i5', 3.5, 8, 'Windows 10', 900),('HP', 'Omen 16', 'AMD Ryzen 7', 4.1, 16, 'Windows 11', 1800),('Dell', 'XPS 13', 'Intel Core i7', 3.8, 16, 'Windows 11', 1700),('Dell', 'Inspiron 15', 'Intel Core i5', 3.6, 8, 'Windows 10', 800),('Lenovo', 'ThinkPad X1', 'Intel Core i7', 3.9, 16, 'Ubuntu 20.04', 1900),('Lenovo', 'IdeaPad 3', 'AMD Ryzen 5', 3.7, 8, 'Windows 10', 700),('Acer', 'Aspire 5', 'Intel Core i5', 3.4, 8, 'Windows 10', 650),('Acer', 'Nitro 5', 'AMD Ryzen 7', 4.2, 16, 'Windows 11', 1400),('MSI', 'GF63 Thin', 'Intel Core i5', 3.5, 8, 'Windows 10', 1100),('MSI', 'Stealth 15M', 'Intel Core i7', 4.0, 16, 'Windows 11', 2200),('Samsung', 'Galaxy Book 3', 'Intel Core i7', 3.8, 16, 'Windows 11', 1600),('Samsung', 'Galaxy Book Go', 'Snapdragon', 2.8, 8, 'Windows 10', 600),('Huawei', 'MateBook X', 'Intel Core i5', 3.6, 8, 'Windows 10', 1300),
('Huawei', 'MateBook D15', 'AMD Ryzen 5', 3.7, 8, 'Windows 10', 750),('Razer', 'Blade 15', 'Intel Core i7', 4.2, 16, 'Windows 11', 3000),('Razer', 'Blade Stealth', 'Intel Core i7', 3.9, 16, 'Windows 10', 2100);

select * from computers;
+---------+----------------+---------------+-----------+------+--------------+-------+
| Brand   | Model          | CPU           | Frequency | RAM  | OS           | Price |
+---------+----------------+---------------+-----------+------+--------------+-------+
| Apple   | MacBook Pro 14 | M1 Pro        |       3.2 |   16 | macOS        |  2500 |
| Apple   | MacBook Air M2 | M2            |       3.5 |    8 | macOS        |  1800 |
| ASUS    | ZenBook 14     | Intel Core i7 |       3.9 |   16 | Windows 10   |  1500 |
| ASUS    | ROG Strix      | AMD Ryzen 7   |         4 |   16 | Windows 11   |  2000 |
| HP      | Pavilion 15    | Intel Core i5 |       3.5 |    8 | Windows 10   |   900 |
| HP      | Omen 16        | AMD Ryzen 7   |       4.1 |   16 | Windows 11   |  1800 |
| Dell    | XPS 13         | Intel Core i7 |       3.8 |   16 | Windows 11   |  1700 |
| Dell    | Inspiron 15    | Intel Core i5 |       3.6 |    8 | Windows 10   |   800 |
| Lenovo  | ThinkPad X1    | Intel Core i7 |       3.9 |   16 | Ubuntu 20.04 |  1900 |
| Lenovo  | IdeaPad 3      | AMD Ryzen 5   |       3.7 |    8 | Windows 10   |   700 |
| Acer    | Aspire 5       | Intel Core i5 |       3.4 |    8 | Windows 10   |   650 |
| Acer    | Nitro 5        | AMD Ryzen 7   |       4.2 |   16 | Windows 11   |  1400 |
| MSI     | GF63 Thin      | Intel Core i5 |       3.5 |    8 | Windows 10   |  1100 |
| MSI     | Stealth 15M    | Intel Core i7 |         4 |   16 | Windows 11   |  2200 |
| Samsung | Galaxy Book 3  | Intel Core i7 |       3.8 |   16 | Windows 11   |  1600 |
| Samsung | Galaxy Book Go | Snapdragon    |       2.8 |    8 | Windows 10   |   600 |
| Huawei  | MateBook X     | Intel Core i5 |       3.6 |    8 | Windows 10   |  1300 |
| Huawei  | MateBook D15   | AMD Ryzen 5   |       3.7 |    8 | Windows 10   |   750 |
| Razer   | Blade 15       | Intel Core i7 |       4.2 |   16 | Windows 11   |  3000 |
| Razer   | Blade Stealth  | Intel Core i7 |       3.9 |   16 | Windows 10   |  2100 |
+---------+----------------+---------------+-----------+------+--------------+-------+

select * from computers order by price desc limit 1;
+-------+----------+---------------+-----------+------+------------+-------+
| Brand | Model    | CPU           | Frequency | RAM  | OS         | Price |
+-------+----------+---------------+-----------+------+------------+-------+
| Razer | Blade 15 | Intel Core i7 |       4.2 |   16 | Windows 11 |  3000 |
+-------+----------+---------------+-----------+------+------------+-------+

select * from computers order by price limit 1;
+---------+----------------+------------+-----------+------+------------+-------+
| Brand   | Model          | CPU        | Frequency | RAM  | OS         | Price |
+---------+----------------+------------+-----------+------+------------+-------+
| Samsung | Galaxy Book Go | Snapdragon |       2.8 |    8 | Windows 10 |   600 |
+---------+----------------+------------+-----------+------+------------+-------+

select Frequency from computers where price between 400 and 1000 and CPU like "%Intel%";
+-----------+
| Frequency |
+-----------+
|       3.5 |
|       3.6 |
|       3.4 |
+-----------+

select count(*) from computers where Brand = "Apple";
+----------+
| count(*) |
+----------+
|        2 |
+----------+

select price from computers where OS like "%Windows%" and RAM = 16 and Brand = "ASU
S" order by price;
+-------+
| price |
+-------+
|  1500 |
|  2000 |
+-------+
