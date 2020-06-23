def pollard_p_1(N, k):
    i=0 
    while i < k[0]:
        a = ZZ.random_element(N) 
        a1 = a 
        print ("\na = {}".format(a)) 
        j=2 
        while j < k[1]:
            a = power_mod(a,j,N) 
            d = gcd(a-1,N) 
            print (j, a, d) 
            if d > 1 and d < N:
                return d, N/d, a1
            if d == N:
                break
            j=j+1
        i=i+1 
    return "Failure"

k = (400,400) 
bound = 2^15 
N = random_prime(bound)*random_prime(bound) 
N = 36147573
print ("N = {} = {}".format(N, factor(N)))

ans = pollard_p_1(N, k) 
if ans != "Failure":
    print ("p = {}, q = {}".format(ans[0], ans[1])) 
    print ("p - 1 = {} = {}".format(ans[0]-1, factor(ans[0]-1))) 
    print ("q - 1 = {} = {}".format(ans[1]-1, factor(ans[1]-1))) 
    t = multiplicative_order(mod(ans[2], ans[0])) 
    print ("ord(a) mod p = {} = {}".format(t, factor(t))) 
    t = multiplicative_order(mod(ans[2], ans[1])) 
    print ("ord(a) mod q = {} = {}".format(t, factor(t)))
else:
    print ("Failure")
