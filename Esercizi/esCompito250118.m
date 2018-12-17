addpath('../');
s = tf('s');

G = 10000*(s+20)/((s+10)*(s^2+100*s+10000))
C = 5/s
Kh = 10

wc = 40;

phMargin = 47.5;
phEpsilon = 1;

[mi,fi] = evalFdT(G*C, wc)
%bode(GX)
if fi>0
	fi = fi - 360
end

ph2gain = +phMargin-fi+phEpsilon-180
pause

[a,t] = RD_MaxGainPh(ph2gain, wc)
C1 = ReteBDerivativa(a,t)
pause
[m,f] = evalFdT(G*Kh*C1*C, wc)
[a2,t2] = RI_MaxLossMod(m, wc)
C2 = ReteBIntegrativa(a2,t2);
C = C*C1*C2;
[mf, ff] = evalFdT(Kh*C*G, wc)
pause

nichols(Kh*C*G)
ngrid

W = feedback(Kh*C*G, 1);
W = W/Kh;
pole(W)
