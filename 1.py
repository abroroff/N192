import pymysql
class MySQL:
    def __init__(self):
        self.ConnectDB()
        self.CreateDB()
        self.CreateTB()

    def ConnectDB(self):
        self.db = pymysql.connect(
            host="localhost",
            user="root",
            password="Zarnigor2006@")
        self.c = self.db.cursor()
    
    def CreateDB(self):
        self.c.execute("create database if not exists new")
        self.c.execute("use new")
    
    def CreateTB(self):
        self.c.execute('''create table if not exists restaurants(
                       id int primary key auto_increment,
                       name varchar(50),
                       address varchar(50),
                       maxPrice decimal(10,2),
                       minPrice decimal(10,2),
                       employeeCount int,
                       expirience int)''')
    
    def InsertTB(self, name,address, maxP, minP, employee, expirience):
        self.c.execute(f'''insert into restaurants(name,address,maxPrice,
                       minPrice,employeeCount,expirience) values(
                       "{name}",
                       "{address}",
                       {maxP},
                       {minP},
                       {employee},
                       {expirience})''')
        self.db.commit()
    def InsertData(self):
        data =[
        ('Metro Grill', 'Tashkent', 120.5, 20.0, 15, 5),
        ('Modern Cafe', 'Samarkand', 80.0, 15.0, 10, 3),
        ('Moon Star', 'Tashkent', 150.0, 30.0, 20, 7),
        ('Magic Burger', 'Andijan', 60.0, 10.0, 8, 2),
        ('Mountain River', 'Fergana', 300.0, 70.0, 30, 12),
        ('Miracle Restoran', 'Bukhara', 180.0, 40.0, 18, 6),
        ('Mega Food', 'Namangan', 90.0, 25.0, 12, 4),
        ('Milan Restoran', 'Tashkent', 250.0, 60.0, 22, 9),
        ('Market Grill', 'Khorezm', 110.0, 20.0, 14, 5),
        ('Modern House', 'Tashkent', 95.0, 18.0, 11, 3)]
        for i in data:
            self.InsertTB(*i)
    
    def FirstQuery(self):
        self.c.execute('''select * from restaurants where name like "M%r" order by maxPrice''')
        res = self.c.fetchall()
        for i in res:
            print(i)
    
    def SecondQuery(self):
        self.c.execute('''select * from restaurants order by minPrice limit 3''')
        res = self.c.fetchall()
        for i in res:
            print(i[1])
    
    def ThirdQuery(self):
        self.c.execute('''select name, maxPrice from restaurants order by expirience desc limit 4''')
        res = self.c.fetchall()
        for i in res:
            print(i[0],i[1])
mysql = MySQL()
#mysql.InsertData()
#mysql.FirstQuery()
#mysql.SecondQuery()
mysql.ThirdQuery()