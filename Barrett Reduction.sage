w=2
W = 2^w
n = 7
N = ZZ.random_element(W^(n-1), W^n)

def barrett_red(A, N, T):
    Q_hat = ((A >> (w*(n-1))) * T) >> (w*(n+1)) 
    R = A - N*Q_hat 
    print(R)
    while R >= N:
        R=R-N
    return R

A = ZZ.random_element(W^(2*n))

N = 12844
A = 96316032
T = W^(2*n) // N

ret1 = barrett_red(A, N, T) 
ret2 = A%N
print ("N = {}".format(N)) 
print ("T = {}".format(T)) 
print ("A = {}".format(A)) 
print ("A%N = {}".format(ret1)) 
print (ret1 == ret2)
