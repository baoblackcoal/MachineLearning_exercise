# y=x+2 linear regression(a=1, b=2)

length = 4
x = (1, 2, 3, 4)
y = (3, 4, 5, 6)

def genMatrix(rows,cols):
    matrix = [[0 for col in range(cols)] for row in range(rows)]
    return matrix

matrix = genMatrix(length, 2)
for i in range(length):
    matrix[i][0] = x[i]
    matrix[i][1] = y[i]
    #print matrix[i][0]
    #print matrix[i][1]

def f(a, b):
    ret = 0
    for i in range(length):
        ret = ret + (a*matrix[i][0]+b - matrix[i][1])**2
    ret = ret / (2 * length)
    return ret

def dfb(a, b):
    ret = 0
    for i in range(length):
        ret = ret + (a*matrix[i][0]+b - matrix[i][1])
    ret = ret / (length)
    return ret

def dfa(a, b):
    ret = 0
    for i in range(length):
        ret = ret + (a*matrix[i][0]+b - matrix[i][1])*matrix[i][0]
    ret = ret / (length)
    return ret

step = 0.2
a = 10
b = 10
loss_changed = f(a, b)
loss = f(a, b)
step_cnt = 0
while (loss_changed > 0.00000001):
    a1 = a
    a = a-step*dfa(a, b)
    b = b-step*dfb(a1, b)
    loss_changed = loss - f(a, b)
    loss = f(a, b)
    step_cnt += 1
    
print "a=%f b=%f step_cnt=%d" % (a, b, step_cnt)

