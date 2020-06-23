c=1
def f(a, N):
    return (a^2 + c)%N

def factorize_Pollard_rho(N):
    a = b = ZZ.random_element(N) # a = b = 2 # a = b = 2 + N 
    start = (a,b) 
    cnt = 0 
    while True:
        cnt = cnt + 1 
        a, b = f(a, N), f(f(b, N), N) 
        d = gcd(N, a - b) 
        print ("({},{}) : {}".format(a,b,d)) 
        if 1 < d < N:
            return d, ZZ(N/d), start, cnt


cnt = 4 
while cnt > 0:
    upper_bound = 2^10
    p = random_prime(upper_bound) 
    q = random_prime(upper_bound) 
    N = p*q 
    #N = 0xaf67
    print ("\nFactor N = 0x{:x}".format(N))
    p1, q1, start, tries = factorize_Pollard_rho(N)
    print ("start = {}".format(start)) 
    print ("cnt = {}".format(tries)) 
    print ("N = 0x{:x} x 0x{:x} : {}".format(p1, q1, N == p1*q1)) 
    cnt = cnt - 1

