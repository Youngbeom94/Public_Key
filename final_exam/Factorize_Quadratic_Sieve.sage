reset()

def gen_composite(nbits):
    bnd = 2^(nbits >> 1)
    while True:
        p = random_prime(bnd-1, lbound = bnd >> 1)
        q = random_prime(bnd-1, lbound = bnd >> 1)
        if p != q:
            N = p * q
            return N

# return
# E = [exponents mod 2]
# if E = Zero list, then the x is perfect square
def get_exp_bin_vec(prime_set, x):
    size = len(prime_set)
    E = [0]*size
    for j in [0..size-1]:
        p = prime_set[j]
        while x%p == 0:
            x = x/p
            E[j] = (E[j] + 1)%2
        j = j + 1
    return E

def f(x, N):
    return (x^2 - N)

# find the first j s.t. j mod m = r
def find_start_idx(start, r, m):
    while True:
        if start%m == r:
            return start
        start = start + 1


def L(X):
    return e^(sqrt( ln(X) * (ln(ln(X)) )))


def showList(L):
    cnt = 0
    for a in L:
        cnt = cnt + 1
        str = "{} ".format(a)
        if cnt%5 == 0:
            print (str)
        else:
            print (str, end = '')
    print("\n")

def find_smooth_integers(N, P, l):
    a = floor(sqrt(N))
    j, L = 0, []
    L = [(a + j,f(a + j, N)) for j in [1..l]]

    print ("\n[(aj,aj^2 - N)]")
    showList(L)
    j = 0
    for p in P:
        ex = 1
        while (a + l) >= ((p^ex) >> 1):
            # find roots of X^2 = N (mod p^ex)
            rts = mod(N, p^ex).sqrt(all = True)
            if len(rts) == 0:
                break
            else:
                for i in [0..len(rts)-1]:
                    t = find_start_idx(a + 1, rts[i], p^ex)
                    if a < t <= a + l:
                        flag = t
                        while flag <= a + l:
                            pos = flag - a - 1
                            L[pos] = (L[pos][0], L[pos][1] / p)
                            flag = flag + p^ex
                        print ("p = {}^{} : roots = {} : start = {}".format(p, ex, rts, t))
                    showList(L)
            ex = ex + 1 # for next exponent
    smooth_integers = [L[j] for j in [0..len(L)-1] if L[j][1] == 1]
    return smooth_integers


# N: target
def factorize(N, B, l):
    print ("N = {} = {}".format(N, factor(N)))
    print ("B = {}".format(B))
    print ("l =", l)
    #############################################
    # Step 1.
    # Generate Prime set less than and equal to B
    #############################################
    prime_set = [j for j in [2..B] if j.is_prime()]
    print ("Prime Set P is", prime_set)
    #############################################
    # Step 2.
    # Find (aj, aj^2 - N) s.t. aj^2 - N is Smooth Numbers
    #############################################
    smooth_integers = find_smooth_integers(N, prime_set, l)
    if len(smooth_integers) == 0:
        print ("There is no smooth number!")
        return "Failure"
    print ("ajs s.t. aj^2 - N is smooth number:", smooth_integers)
    #############################################
    # Step 3.
    # Find J for perfect square
    #############################################
    A, M = [], []
    k = 0
    while k < len(smooth_integers):
        a = smooth_integers[k][0] # aj
        t = a^2 - N
        vec = get_exp_bin_vec(prime_set, t)
        if vec.count(0) == len(prime_set):
            b = t.sqrt()
            d = gcd(N, a - b)
            if 1 < d < N:
                print ("a = {} : {} : a^2 - N = {}".format(a, vec, factor(t)))
                print("{} = {} x {}: a = {} : a^2 - N = {} : Success".format(N, d, N/d, a, factor(t)))
                return "Success"
        print ("a = {} : {} : a^2 - N = {}".format(a, vec, factor(t)))
        M = M + [vec]
        k = k + 1

    M = Matrix(GF(2), M).transpose()
    print ("M ="); print (M)
    nullM = M.right_kernel()

    if rank(nullM) == 0:
        print("Failure (0-dim)")
        return "Failure"
    else:
        print ("Basis of roots space.\n", nullM)
        for c in nullM:
            J = c.support()
            if J != []:
                print (c, "support =", c.support())
                a, b = 1, 1
                for j in J:
                    aj = smooth_integers[j][0] # aj
                    t = aj^2 - N
                    a = a * aj  
                    b = b * (aj^2 - N)
                b = b.sqrt()
                d = gcd(N, a - b)
                print (d)
                if 1 < d < N:
                    print("{} = {} x {}: Success with J = {}".format(N, d, N/d, c))
                    return "Success"
        return "Failure"



#############################################
# Step 1.
# Generate n-bit Random Composite N = p*q
# Parameter Setup
#############################################
N = gen_composite(20)

B = ceil(L(N)^(1/sqrt(2)))
l = ceil(L(N)^(sqrt(2)))

N = 7 * 11
B = 5
l = 7
#############################################
# Step 2. Factor N with B and l
#############################################
factorize(N, B, l)