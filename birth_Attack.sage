n,k = 365,50 
L = [] 

for i in [1..k]:
    p = 1 - prod([(n-j)/n for j in [0..i-1]])
    L += [[i,p]]

show(list_plot(L) + line([(0,0.5), (k,0.5)], color ='red'))

for i in L:
    print ([i[0],i[1].n(digits=4)])
