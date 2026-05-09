create table reservation(
    id int primary key auto_increment,
    user_name varchar(100) not null,
    book_title varchar(100) not null,
    days int not null,
    daily_price decimal(10,2) not null,
    borrow_date date not null,
    return_status varchar(100) not null,
    books_count int not null);



INSERT INTO reservation (
    user_name,
    book_title,
    days,
    daily_price,
    borrow_date,
    return_status,
    books_count
    )
    VALUES
    ('Ali Valiyev', 'Python', 3, 20000, '2026-05-01', 'Qaytarilgan', 1),
    ('Nodira Karimova', 'SQL basics', 5, 25000, '2026-05-02', 'Qaytarilmagan', 2),
    ('Bekzod Ismoilov', 'Java OOP', 2, 30000, '2026-05-03', 'Qaytarilgan', 1),
    ('Madina Ergasheva', 'Algorithms', 4, 22000, '2026-05-04', 'Qaytarilmagan', 3),
    ('Sardor Hasanov', 'Data Science', 6, 35000, '2026-05-05', 'Qaytarilgan', 2),
    ('Dilshod Qodirov', 'C++ Basics', 3, 18000, '2026-05-06', 'Qaytarilmagan', 1),
    ('Shahnoza Mirzayeva', 'Web Dev', 7, 40000, '2026-05-07', 'Qaytarilgan', 4),
    ('Umid Rustamov', 'DSA', 2, 28000, '2026-05-08', 'Qaytarilmagan', 2),
    ('Kamola Tursunova', 'AI Basics', 5, 50000, '2026-05-09', 'Qaytarilgan', 3),
    ('Javohir Sobirov', 'Networking', 1, 15000, '2026-05-10', 'Qaytarilmagan', 1);



    select * from reservation order by borrow_date desc;


    
    select * from reservation order by daily_price desc limit 3;



    select * from reservation where return_status="Qaytarilmagan";



    select book_title, avg(daily_price) from reservation group by book_title;



    select * from reservation where days > 3;



    select * from reservation order by days desc limit 1;



    select return_status, count(return_status) from reservation group by return_status;



    select * from reservation where books_count > 2;



    select sum(books_count) as Total from reservation;



    select * from reservation where daily_price > 30000;
