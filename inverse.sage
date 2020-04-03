def inv_by_eea(a, p):
    t0, t1 = a, p
    u0, u1 = 1, 0
    while t1 != 0:
        t2, t0 = t0, t1
        q, t1 = t2 // t1, t2 % t1
        u2, u0 = u0, u1
        u1 = u2 - q*u1
    if u0 < 0:
        u0 = u0 + p
    return t0, u0


p =  2^(256) - 2^(224) + 2^(192) + 2^(96) - 1
a = 20200402

T = inv_by_eea(a,p)

print(T[0] == (a*T[1]%p))
print("{} = {} * {} mod {}".format(T[0],a,T[1],p))