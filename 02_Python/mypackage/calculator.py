# mypackage/calculater.py

# 변수 (global)
__version__ = 0.1

# 함수
def plus(num1, num2):
    return num1 + num2

def munis(num1, num2):
    return num1 - num2

def multiply(num1, num2):
    return num1 * num2

def divide(num1, num2):
    return num1 / num2
    
if __name__ == "__main__":
    print(">>>>>>name<<<<<<", __name__)
    print(plus(10, 20))
    print(munis(20, 5))
    print(multiply(20, 5))




