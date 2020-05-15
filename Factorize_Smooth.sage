# F is the set of primes 

def is_smooth(F, x):
    E = [0]*len(F)
    for j in [0..len(F)-1]:
        while x%F[j] == 0:
            x = x/F[j]
            E[j] = (E[j] + 1)%2 
        j=j+1
    if x == 1:
        return "YES", E
    return "NO"

def factorize(F, N, count):
    print ("Target = {}".format(N)) 
    cnt = 0
    A, M = [], []
    while cnt < count:
        a = ZZ.random_element(x = 1, y = N-1)
        t = (a*a)%N
        ans = is_smooth(F, t)
        if ans[0] == "YES" and ans[1].count(0) != len(ans[1]):
            A = A + [a]
            print ("a = {}\n -> a^2 mod N = {}\n -> {}".format(a, factor(t), ans[1]))
            M = M + [ans[1]]
            cnt = cnt + 1

    M = Matrix(GF(2),M).transpose()
    print ("M ="); print (M)
    nullM = M.right_kernel()
    print ("Basis of roots space.\n", nullM)

    for c in nullM:
        J = c.support()
        if J != []:
            print (c, c.support()) 
            a, b = 1, 1
            for j in J:
                a = a * A[j]
                b = b * ((A[j] * A[j])%N)
            b = b.sqrt()
            d = gcd(N, a-b)
            if 1<d<N:
                return "{} = {} x {}: Success\nwith J = {}".format(N,d,N/d,c)
    return "Failure"

B = 2^3
P = [j for j in [2..B] if j.is_prime()]
print ("Set P is {} (#P = {})".format(P, len(P)))

bound = 2^8
while True:
    p = random_prime(bound-1, lbound = bound >> 1) 
    q = random_prime(bound-1, lbound = bound >> 1) 
    if p != q:
        N=p*q 
        break
        
print (factorize(P, N, len(P) + 1))
print ("\n")
#print (factorize(P, N, 8))
