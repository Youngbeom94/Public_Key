def EEA_rec(a,b): 
    if b == 0:
        return a, 1, 0
    d, alpha, beta = EEA_rec(b, a%b) 
    T = d, beta, alpha - (a//b)*beta 
    print ("{:4} = ({:4}) * {:4} + ({:4}) * {:4}".format(d, a, T[1], b, T[2])) 
    return T


a, b = ZZ.random_element(10000), ZZ.random_element(10000) 
print ("(a,b) = ({},{})".format(a,b)) 
result = EEA_rec(a,b) 
print (result == xgcd(a,b))
