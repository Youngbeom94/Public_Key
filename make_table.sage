def inv_by_eea(a, p): 
    t0, t1 = a, p                   #확장 유클리드 알고리즘을 이용하는 방법이다.
    u0, u1 = 1, 0                   #ap + by = 1 에서 p는 mod p에서 없어지는 것을 이용한다..
    while t1 != 0:
        t2, t0 = t0, t1             #iteration ver의 확장 유클리드 알고리즘이며 값을 갱신해준다.   
        q, t1 = t2 // t1, t2 % t1
        u2, u0 = u0, u1
        u1 = u2 - q*u1
    if u0 < 0:                      #유한체 연산이므로 음수이게되면 P를 더해준다.
        u0 = u0 + p
    return t0, u0


p =  2^(4) - 2^(224) + 2^(192) + 2^(96) - 1   #p값 세팅해주기
a = 20200402

T = inv_by_eea(a,p)

print(T[0] == (a*T[1]%p))
print("{} = {} * {} mod {}".format(T[0],a,T[1],p))

