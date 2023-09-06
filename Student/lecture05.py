def square(x):
    return x**2

sqrfunc = lambda a: a**2
print(sqrfunc(5))
print(square(5))


def double(x):
    return 2*x
dbl = lambda x: 2*x
def compose(g, f):
    return lambda a: g(f(a))

square_after_double = compose(square, double)
double_after_square = compose(double, square)

print("square_after_double(5) = ", square_after_double(5))
print("double_after_square(5) = ", double_after_square(5))

# doing that with lambda functions
print("square after double with lambda =", compose(lambda a: a**2, lambda x:x*2)(5))
print("square after double with lambda =", compose(lambda a: a*2, lambda x:x**2)(5))
