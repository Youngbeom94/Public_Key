def legendre(a, p):
    t=1 
    print ("t={:3}, a={}, p={}".format(t,a,p)) 
    while a != 0:
        while a%2 == 0:
            a, r = a/2, p%8 
            if r == 3 or r == 5:
                t = -t
            print ("t={:3}, a={}, p={}".format(t,a,p))
        a, p = p, a 
        if a%4 == p%4 == 3:
            t = -t
        print ("t={:3}, a={}, p={}".format(t,a,p))
        a = a%p 
        print ("t={:3}, a={}, p={}".format(t,a,p))
    if p == 1:
        return t
    else:
        return 0


p = 760611791
a = 72102301
print ("a={}, p={}".format(a,p)) 
ret = legendre(a, p)
print (ret) 
print (ret == kronecker(a,p))

