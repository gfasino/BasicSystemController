addpath('../');
s = tf('s');

G = 1/(s*(1+0.1*s)*(1+0.2*s));
C = 30;
H = 1;

wc = 8;

phMargin = 47.5;
phEpsilon = 1;

[mi,fi] = evalFdT(G*C, wc)

if fi>0
	fi = fi - 360
end
ph2gain = +phMargin-fi+phEpsilon-180
pause

%da carte m=12 wt=4
a = 1/12;
t = 1/2;
C1 = ReteBDerivativa(a,t)


[m,f] = evalFdT(G*C*C1, wc)
[a2,t2] = RI_MaxLossMod(m, wc)
C2 = ReteBIntegrativa(a2,t2);
C = C*C1*C2;
[mf, ff] = evalFdT(C*G, wc)
pause

W = feedback(C*G, 1);
bode(W)
bandwidth(W)

