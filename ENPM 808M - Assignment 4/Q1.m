syms a b c d t

eqn1 = (a*0^3) + (b*0^2) + (c*0) + d == 0;
eqn2 = (a*5^3) + (b*5^2) + (c*5) + d == 15;
eqn3 = (a*0^3) + (b*0^2) + (c*1) + 0 == 0;
eqn4 = (3*a*5^2) + (2*b*5^1) + (c*1) + 0 == 0;

sol = solve([eqn1,eqn2,eqn3,eqn4],[a,b,c,d]);
sol.a
sol.b
sol.c
sol.d

f(t) = (sol.a*t^3) + (sol.b*t^2) + (sol.c*t) + sol.d;
ezplot(f,[0 5])