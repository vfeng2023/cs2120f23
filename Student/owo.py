from z3 import *

X = Real('x')
Y = Real('Y')

s = Solver()

s.add(X**2+Y**2 == 1)
# s.add(X**3 + Y**3 == 1)

if s.check() == sat:
    m = s.model()
    print(m)