/-
Write a recursive function that concatentates a string n times
-/

#eval concatn 3 "Hello" --HelloHelloHello

/-
Find the cube  of the integers from 1 to n
-/

#eval sum_cubed 5 --idk

/-
find the sum of the values in a list
-/

def myist := [1,2,3,4,5]
#eval find_sum myist --15

/-
Write a function that reverses the digits in a positive integer
-/

#eval reverse 123 --expect 321
#eval reverse 670 --expect 67