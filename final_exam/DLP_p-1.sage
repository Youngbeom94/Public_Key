reset() 
# parameter 
p = random_prime(2^12) 
F = GF(p)

while True:
    g = F.random_element() 
    if g == 0:
        continue
    n = g.multiplicative_order() 
    if n.is_prime() == True:
        break

x = ZZ.random_element(2, p)

# problem: g^x = h 
h = power_mod(g,x,p) 
print ("[Problem] {}^x = {} over GF({}) : {}^{} = 1".format(g, h, p, g, n))

def f(x):
    if ZZ(x[0])%3 == 1:
        return ((x[0]*h),x[1], (x[2]+1)%n)
    if ZZ(x[0])%3 == 0:
        return ((x[0]^2), (2*x[1])%n, (2*x[2])%n)
    if ZZ(x[0])%3 == 2:
        return ((x[0]*g), (x[1]+1)%n,x[2])

#-----------------------------------------------------------------------------
cnt = 0 
while cnt < 10:
    #x1 = x2 = (1, 0, 0) 
    a = ZZ.random_element(n) 
    b = ZZ.random_element(n) 
    x1 = x2 = (g^a*h^b, a, b) 
    i=0 
    while(1):
        print (i, x1, x2) 
        i=i+1 
        x1, x2 = f(x1), f(f(x2)) 
        if x1[0] == x2[0]:
            break
    print (i, x1, x2) 
    T1, T2 = (x1[1] - x2[1])%n, (x2[2] - x1[2])%n 
    if T2 == 0:
        print ("Failure.") 
        cnt = cnt + 1
    else:
        T2 = T2.xgcd(n)[1]%n 
        root = (T1*T2)%n 
        print ("x =", root, "(", (g^root)%p == h, ")") 
        break
