# y=x+2 linear regression(a=1, b=2) x(1, 2) y(3, 4)

length = 2

def f(a, b):
    return ((a*1+b - 3)**2 + (a*2+b - 4)**2) / (2*length)

def dfb(a, b):
    return ((a*1+b - 3) + (a*2+b - 4)) / length

def dfa(a, b):
    return ((a*1+b - 3)*1 + (a*2+b - 4)*2) / length 

step = 0.9
a = 10
b = 10
loss_changed = f(a, b)
loss = f(a, b)
step_cnt = 0
while (loss_changed > 0.00000001):
    a = a-step*dfa(a, b)
    b = b-step*dfb(a, b)
    loss_changed = loss - f(a, b)
    loss = f(a, b)
    step_cnt += 1
    
print "a=%f b=%f step_cnt=%d" % (a, b, step_cnt)


