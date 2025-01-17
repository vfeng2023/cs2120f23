from z3 import *
d, a, t, v_i, v_f = Reals('d a t v__i v__f')

equations = [
   d == v_i * t + (a*t**2)/2,
   v_f == v_i + a*t,
]
print ("Kinematic equations:")
print (equations)

# Given v_i, v_f and a, find d
problem = [
    v_i == 20,
    v_f == 1,
    a   == -8
]
print ("Problem:")
print (problem)

print ("Solution:")
solve(equations + problem)
# s = Solver()

# s.add(*equations)
# s.add(*problem)
# #solve(equations + problem)
# if s.check()==sat:
#     s.model()