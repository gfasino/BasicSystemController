addpath('../');
s = tf('s');

G = 2*(s+1)/((2*s+1)*(8*s+1)*(100*s+1))
C = 25/s
Kh = 1/5

wc = 0.07;

phMargin = 47.5;
phEpsilon = 35;
AA = G*C*Kh;
[mi,fi] = evalFdT(AA, wc)
%bode(AA)
if fi>0
	fi = fi - 360
end

ph2gain = +phMargin-fi+phEpsilon-180
%pause

[a,t] = RD_MaxGainPh(ph2gain/3, wc)
C1 = ReteBDerivativa(a,t)
CDo=C1
C1=C1*C1*C1
[m,f] = evalFdT(G*Kh*C1*C, wc)
pause;

[a2,t2] = RI_MaxLossMod(m/2, wc)
C2 = ReteBIntegrativa(a2,t2);
C = C*C1*C2*C2;
[mf, ff] = evalFdT(Kh*C*G, wc)
pause

nichols(Kh*C*G)
ngrid

W = feedback(Kh*C*G, 1);
W = W/Kh;
pole(W)
