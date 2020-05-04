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

'''
p = 760611791
a = 72102301
print ("a={}, p={}".format(a,p)) 
ret = legendre(a, p)
print (ret) 
print (ret == kronecker(a,p))
'''

p = random_prime(100) 


######### p = 3 (mod4)
def find3_4(p):
    while(1):
        a = ZZ.random_element(3,p)
        if(a % 4 == 3):
            ret = kronecker(a,p)
            if(ret == 1):
                return a

def check3_4(a,p):
    temp = (p+1)/4
    temp2 = (a^temp) % p
    temp3 = (temp2 * temp2) % p
    if(temp3 == a):
        print("square root = ", temp2)
    else:
        print("false")
    return

######### p = 5 (mod 8)
def find5_8(p):
    while(1):
        a = ZZ.random_element(3,p)
        if(a % 8 == 5):
            ret = kronecker(a,p)
            if(ret == 1):
                return a

def check5_8(a,p):
    temp = (p-1)/4
    temp2 = (a^temp)
    temp2 = temp2 % p
    if(temp2 == 1):
        temp3 = ((p+3)/8)
        temp3 = (a^temp3)
        temp3 = temp3 % p
        temp4 = (temp3 * temp3)
        temp4 = temp4 % p
        if(temp4 == a):
            print("square root = ", temp4)
            return


a = find3_4(p)
print("p = ", p)
print("a = ", a)
check3_4(a,p)

