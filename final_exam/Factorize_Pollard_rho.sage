c=1
def f(a, N):
    return (a^2 + c)%N

def factorize_Pollard_rho(N):
    a, b = 2, 2
    k = 0
    while True:
        a, b = f(a, N), f(f(b, N), N) 
        d = gcd(N, a - b)
        print("(a,b) = ",a,b, "d = ",d)
        if 1 < d < N:
            print("!!(a,b) = ",a,b)
            print("d = ",d)
            print("k = ", k)
            print ("N = {} x {}\n".format(d, N/d))
            break
        if d == N:
            print ("Failure\n")
            break
        k = k + 1

cnt = 1
while cnt > 0:
    upper_bound = 2^10
    p = random_prime(upper_bound) 
    q = random_prime(upper_bound) 
    N = p*q
    N = 268867
    print ("p = {}, q = {}".format(p, q)) 
    print ("N =", N)
    factorize_Pollard_rho(N) 
    cnt = cnt - 1