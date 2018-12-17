addpath('../');

s = tf('s');
G = 10*(s+4)/((s^2+1.5*s+1)*(s+400))

Kh = 1
Ki = 1
Kp = 1

C = (Ki+Kp*s)/s
GX = G*C*Kh

bode(G)
hold on
bode(G*C)
pause;

wc = 2.8;
phMargin = 45.8;
phEpsilon = 5;

[mi,fi] = evalFdT(GX, wc)
%bode(GX)
if fi>0
	fi = fi - 360
end

ph2gain = +phMargin-fi+phEpsilon-180

[a,t] = RD_MaxGainPh(ph2gain, wc)
C1 = ReteBDerivativa(a,t)
[m,f] = evalFdT(GX*C1, wc)
%pause

if m>0
	[a,t] = RI_MaxLossMod(-m, wc)
	C2 = ReteBIntegrativa(a,t)
else
	[a,t] = RD_MaxGainMod(-m, wc)
	C2 = ReteBDerivativa(a,t)
end
bode(GX)
hold on
bode(C1*C2)
hold on
bode(GX*C1*C2)
%rlocus(AA)
[m,f] = evalFdT(GX*C1*C2, wc)
AC = G*C*C1/(1+G*C1*C2*C*Kh);
pole(AC)

disp("Mr in dB")
getPeakGain(AC)-dcgain(AC)
disp("Bw")
bandwidth(AC)
figure
step(AC)
