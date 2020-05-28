def get_l(a):
    cnt = 0 
    while true:
        if (a & 1) == 0:
            a, cnt = a >> 1, cnt + 1
        else:
            return cnt


def is_composite(n, q, l, a):
    a = a ^ q % n 
    print("a^(q) = {}".format(a)) 
    if (a % n) == 1:
        return "NOT Composite" 
    for j in [0..l-1]:
        print("a^(2^{}*q) = {}".format(j, a)) 
        if (a % n) == n-1:
            return "NOT Composite"
        a = (a ^ 2 % n) 
    return "Composite"


def is_prime_by_miller_rabin(n, k):
    l = get_l(n-1)
    q = (n - 1) >> l 
    print ("l = {}, q = {}".format(l,q))
    while k > 0:
        a = ZZ.random_element(2,n-2)
        #a = 77
        print ("a = {}".format(a)) 
        ret = is_composite(n, q, l, a) 
        if ret == "Composite":
            return "Composite"
        k=k-1
        return "Probably Prime"

n = (2^255) + 325610659388873400306201440571661405155
# n = random_prime(100000) 
print ("n = {}".format(n)) 
#print (is_prime_by_miller_rabin(n, 20)) 
print (n.is_prime())
