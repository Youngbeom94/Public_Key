E = EllipticCurve(GF(5), [3,3]) # E: Y^2Z = X^3 + 3XZ^2 + 3Z^3 
print ("E is {}".format(E)) 
print ("Group = {}".format(E.points())) 
print ("Group order = {}".format(E.cardinality())) 
print ("Identity = {}".format(E(0)))

for P in E:
    for Q in E:
        print ("{} + {} = {}".format(P, Q, P + Q))

P = E.gens()[0] 
print ("Generator = {}".format(P)) 
print ("Order of generator = {}".format(P.order())) 
for i in [1..E.cardinality()]:
    print ("{}P = {}".format(i, i*P))
for R in E:
    print ("Order of {} = {}".format(R, R.order()))