def get_s_and_t(n):
    s, t = 0, n
    while t%2 == 0:
        s, t = s + 1, t >> 1
    return s, n/(2^s)

def get_quadratic_non_residue(p):
    b = ZZ.random_element(p)
    while -1 != kronecker(b, p):
        b = ZZ.random_element(p)
    return b

def get_square_root_by_TS(a, p):
    if kronecker(a, p) == -1:
        return "No root"
    a_inv = a.xgcd(p)[1]
    print ("a^-1 = {}".format(a_inv))
    s, t = get_s_and_t(p-1)
    print ("s = {}, t = {} (p-1 = 2^s x t)".format(s, t))
    b = get_quadratic_non_residue(p)
    print ("b = {} (in QNRp)".format(b))
    r, c = (a^((t+1)/2))%p, (b^t)%p
    print ("r[0] = ({}^(({}+1)/2))%{} = {}".format(a, t, p, r))
    print ("c = b^t = ({}^{})%{} = {}".format(b, t, p, c))
    cnt = 1
    for j in [1..s-1]:
        d = ((r^2*a_inv)^(2^(s-1-j)))%p
        if d == p-1:
            r = (r*c)%p
            print ("ord(r[{}]^2 a^-1) = 2^{}".format(cnt-1, s-j))
            print ("r[{}] = r[{}]*c^(2^({})) = {}".format(cnt, cnt-1, j-1, r))
            cnt = cnt + 1
        c = (c^2)%p
        print ("c^(2^{}) = {}".format(j, c))
    c = (c^2)%p
    print ("c = {}".format(c))
    return r, -r

#a, p = 5, random_prime(1000)
p = 97
a = ZZ.random_element(p)
print ("a = {}, p = {}".format(a,p))
root = get_square_root_by_TS(a, p)
if root != "No root":
    print ("Roots are {} and {}".format(root[0], root[1]))
    print (root[0]^2%p == a, root[1]^2%p == a)
else:
    print ("No root")