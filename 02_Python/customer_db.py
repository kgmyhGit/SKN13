###########################
# SQL 실행 코드를 함수화
###########################
from datetime import date
import pymysql

def select_customer_by_id(cust_id: int) -> tuple|None:
    """
    고객 id로 고객정보를 DB에서 조회해서 반환하는 함수.
    Args:
    Returns:
        tuple: 조회결과
        None: 조회결과가 없을 경우
    Raises:
    """
    sql = "select * from customer where id = %s" 
    with pymysql.connect(host="127.0.0.1", port=3306, user='playdata', password='1111', db='mydb') as conn:
        with conn.cursor() as cursor:
            result = cursor.execute(sql, [cust_id])
            return cursor.fetchone()

def select_all_customer():
    """
    전체 고객정보를 조회하는 함수
    select * from customer;
    """
    pass

def update_customer(cust_id:int, name:str, email:str, tall:float, birthday:date|str) -> int:

    sql = ("update customer "
           "set name=%s, email=%s, tall=%s, birthday=%s "
           "where id=%s")
    with pymysql.connect(host="127.0.0.1", port=3306, user='playdata', password='1111', db='mydb') as conn:
        with conn.cursor() as cursor:
            result = cursor.execute(sql, (name, email, tall, birthday, cust_id))
            conn.commit()
            return result
