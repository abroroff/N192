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
        self.c.execute("create database if not exists school")
        self.c.execute("use school")
    
    def CreateTB(self):
        self.c.execute('''create table if not exists teacher(
                       name varchar(50),
                       surname varchar(50),
                       salary int,
                       experience int,
                       branch varchar(50))''')
    
    def InsertTB(self,name,surname,salary,experience,branch):
        self.c.execute(f'''insert into teacher values(
                       "{name}",
                       "{surname}",
                       {salary},
                       {experience},
                       "{branch}")''')
        self.db.commit()
    
    def InsertData(self):
        res = [('Ali', 'Karimov', 500, 5, 'Yunusobod'),
            ('Vali', 'Aliyev', 700, 8, 'Chilonzor'),
            ('Sami', 'Hasanov', 600, 6, 'Olmazor'),
            ('Aziz', 'Karimov', 800, 10, 'Yakkasaroy'),
            ('Jasur', 'Rahimov', 550, 4, 'Chilonzor'),
            ('Bekzod', 'Aliyev', 750, 9, 'Yunusobod'),
            ('Rustam', 'Qodirov', 650, 7, 'Olmazor')]
        for i in res:
            self.InsertTB(*i)
    
    def FirstQuery(self):
        self.c.execute("select * from teacher order by salary")
        res = self.c.fetchall()
        for i in res:
            print(i)
    
    def SecondQuery(self):
        self.c.execute("select * from teacher order by salary, experience desc")
        res = self.c.fetchall()
        for i in res:
            print(i)
    
    def ThirdQuery(self):
        self.c.execute("update teacher set salary = salary-100 order by salary desc limit 1")
        res = self.c.fetchall()
        for i in res:
            print(i)
    
    def FourthQuery(self):
        self.c.execute('''"update teacher set branch = "Chilonzor" order 
                       by experience desc limit 1''')
        res = self.c.fetchall()
        for i in res:
            print(i)
    
    def FifthQuery(self):
        self.c.execute("select * from teacher order by surname")
        res = self.c.fetchall()
        for i in res:
            print(i)
    
    def SixthQuery(self):
        self.c.execute("select * from teacher order by salary desc")
        res = self.c.fetchall()
        for i in res:
            print(i)
    
    def SeventhQuery(self):
        self.c.execute("select sum(salary * experience) as total from teacher")
        res = self.c.fetchall()
        for i in res:
            print(i)
    
mysql = MySQL()
#mysql.InsertData()
#mysql.FirstQuery()
#mysql.SecondQuery()
#mysql.ThirdQuery()
#mysql.FourthQuery()
#mysql.FifthQuery()
#mysql.SixthQuery()
#mysql.SeventhQuery()
