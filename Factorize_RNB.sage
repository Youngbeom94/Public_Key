def factorize(N, R, B):
    print ("N = {}".format(N)) 
    for r in [1..R]:
        if r != 2:
            rN = r*N
            f1,f2,a = 0,0,0 
            for b in [1..B]:
                a2 = rN + b^2
                if a2.is_square() == True:
                    a = a2.sqrt()
                    d = gcd(N, a-b)
                    if 1 < d and d < N:
                        print ("(r,a,b) = ({},{},{}): {}x{}={}" .format(r,a,b,d, N/d, N))
    return "Success"

upper_bound = 2^20 
B = 10000
R = 10000

cnt = 10
while cnt >0:
    N = random_prime(upper_bound)*random_prime(upper_bound) 
    print (factorize(N, B, R))
    cnt = cnt - 1