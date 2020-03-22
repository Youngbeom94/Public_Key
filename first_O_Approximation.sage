f(x) = e^x
g(x) = 1 + x 
R = (x, -1, 1) 
A = plot(f(x), R) 
B = plot(g(x), R, aspect_ratio=1, color='red') 
show(A + B, ymin=g(-1), ymax=g(1))
