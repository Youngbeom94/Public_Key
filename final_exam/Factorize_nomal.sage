def factorize(N, B):
    print ("N = {}".format(N))
    f1,f2,a = 0,0,0
    for b in [1..B]:
        a2 = N + b^2 
        if a2.is_square() == True:
            a = a2.sqrt()
            f1,f2 = a-b, a+b
            print ("{}x{}=({}-{})({}+{})={}: {}".format(f1, f2, a, b, a, b, f1*f2, f1*f2 == N))
            return "Success\n"
    return "Failure\n"

upper_bound = 2^15
B = 10000

cnt = 10 

'''
while cnt > 0:
    N = random_prime(upper_bound)*random_prime(upper_bound)
    print (factorize(N, B))
    cnt = cnt - 1
'''

print (factorize(25217, B))
print (factorize(203299, B))