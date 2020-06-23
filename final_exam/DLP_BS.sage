from operator import itemgetter

def show_list(L):
    cnt = 0 
    while cnt < len(L):
        print ("{}, ".format(L[cnt]), end = '') 
        cnt = cnt + 1 
        if (cnt%5 == 0):
            print ("\n", end = '')
    print ("\n")

NO_ELEMENT = "NO_ELEMENT"

def bin_search(list, target):
    size = len(list) 
    if size < 1:
        return NO_ELEMENT
    mid = (size-1) >> 1 
    if list[mid][1] == target:
        return list[mid][0]
    if list[mid][1] < target:
        return bin_search(list[mid+1:], target)
    else:
        return bin_search(list[:mid], target)

def dlp_bsgs(p,g,h):
    m = 1 + floor(sqrt(p-1)) 
    print ("m = {} = 0x{:x}".format(m, m)) 
    L, t = [], 1

    for j in [0..m-1]:
        L = L + [[j,t]] 
        t = (t * g)%p
    print ("L1 ="); show_list(L) 
    L = sorted(L, key = itemgetter(1))
    print ("Sorted L1 ="); show_list(L)

    inv_g = g.xgcd(p)[1]%p 
    w, t = (inv_g^m)%p, h 
    root = "UNKNOWN" 
    L2 = [] 
    for j in [0..m-1]:
        L2 = L2 + [[j, t]] 
        i = bin_search(L, t) 
        if i != NO_ELEMENT:
            print ("L2 =") 
            show_list(L2) 
            print ("(i,g^i) = ({},{})".format(i,power_mod(g,i,p))) 
            print ("(j,hg^(-jm)) = ({},{})".format(j,t)) 
            root = (i + m*j)%(p-1) # p-1: group order 
            break
        t = (t * w)%p
    print ("x =", root) 
    print (power_mod(g,root,p) == h)

# problem: g^x = h over GF(p) 
p = random_prime(2^10, lbound = 2) 
g = primitive_root(p) 
x = ZZ.random_element(2, p) 
h = power_mod(g, x, p)

print ("[Problem] {}^x = {} over GF({})".format(g, h, p)) 
dlp_bsgs(p, g, h)

