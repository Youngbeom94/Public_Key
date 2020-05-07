# w = 8; W = 2^w
w = 8; W = 2^w
# input x, N 
# return xR^(-1) mod N 
def MontRed(x, r, n, nn):
    m = ((x%r) * nn)%r 
    t = (x + m*n) >> (len(r.bits()) - 1) 
    if t >= n:
        t=t-n
    return t

def ModExp_by_MontRed(x, e, n, nn, r, phi1): 
    phix = (x << (len(r.bits()) - 1))%n
    l = len(e.bits()) - 1 
    t = phi1 
    while l > -1 :
        t = MontRed(t^2, r, n, nn)
        # print("t^2 = ",t)
        if (e >> l) & 0x1:
            t = MontRed(t * phix, r, n, nn)
            # print("t*phix = ",t)
        l=l-1
    t = MontRed(t, r, n, nn) 
    return t

# N = ZZ.random_element(W^10, W^20) 
N = 789
N = (N << 1) + 1 # odd N 
t=1 
while True:
    R = W^(t) 
    if (gcd(R,N) == 1) and (N < R):
        break
    else:
        t=t+1

R = W^(t)

print ("N = {} (given)".format(hex(N))) 
print ("R = {}".format(hex(R)))

invN = inverse_mod(N, R) 
NN = (- invN)%R 
phi1 = R%N

print ("Pre-computed values:") 
print ("N^(-1) = {}".format(hex(invN))) 
print ("N’ = {}".format(hex(NN))) 
print ("phi(1) = R mod N = {}".format(hex(phi1)))

# x = ZZ.random_element(0, N-1) 
x = 123
e = 456
# e = ZZ.random_element(0, 0x10)
print ("x = {}".format(hex(x))) 
print ("e = {}".format(hex(e))) 
print ("x^e mod N = {} (sage)".format(hex((x^e)%N))) 
print ("x^e mod N = {} (using MontRed)".format(hex(ModExp_by_MontRed(x, e, N, NN, R, phi1))))
print ((x^e)%N == ModExp_by_MontRed(x, e, N, NN, R, phi1))
