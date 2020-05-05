def pollard_p_1(N, k):
    a, j = 2, 2 
    while j < k:
        a = a^j%N 
        d = gcd(a-1,N) 
        print (j, a, d) 
        if d > 1 and d < N:
            return d, N/d
        j=j+1 
    return "Failure"

k = 400

#N = random_prime(2^20)*random_prime(2^20)
N = 574841

print ("N = {} = {}".format(N, factor(N))) 
p = pollard_p_1(N, k) 
if p != "Failure":
    print ("p = {}, q = {}".format(p[0], p[1])) 
    print ("p - 1 = {}".format(factor(p[0]-1))) 
    print ("q - 1 = {}".format(factor(p[1]-1)))
else:
    print ("Failure")
