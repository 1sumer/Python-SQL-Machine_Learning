import Addition 
import Subtraction
import Multiplication
import Division

ope = input("Chose a Option (+/-/*//): ")

a = int(input("Enter First Number: "))
b = int(input("Enter Second Number: "))
if ope == "+":
    print("Addition of", a, "and", b, "is:", Addition.addition(a, b))
    
elif ope == "-":
    print("Subtraction of", a, "and", b, "is:", Subtraction.subtraction(a, b))

elif ope == "*":
    print("Multiplication of", a, "and", b, "is:", Multiplication.multiplication(a, b))

elif ope == "/":
	print("Division of", a, "and", b, "is:", Division.division(a, b))
else:
	print("Operation Not Found")