def f(x):
    return x*x

def df(x):
    return 2*x

step = 0.1
x = 2
loss_changed = f(x)
loss = f(2)
while (loss_changed > 0.00000001):
    x = x-step*df(x)
    loss_changed = loss - f(x)
    loss = f(x)

print "x = %f for min y" % (x)
