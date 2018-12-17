addpath('../');

s = tf('s');
G = 100*(s+10)/(s*(s+20)*(s+50))

%guadagno = 0.2
Kh = 5

C = 60/s
GX = G*C*Kh

fdt = C*G/(1+C*G*Kh)
%rlocus(fdt)
%pole(fdt)
%pause;

wc = 60;
phMargin = 41.8;
phEpsilon = 5;

[mi,fi] = evalFdT(GX, wc)
%bode(GX)
if fi>0
	fi = fi - 360
end

ph2gain = +phMargin-fi+phEpsilon-180
%pause;

if ph2gain > 60
	disp('troppa fase da guadagnare uso due reti')
	%[a,t] = RD_MaxGainPh(ph2gain/2, wc)
	C1 = ReteBDerivativa(1/7, 3/60)
	Cold = C1;
	C1 = C1*C1;
else
	[a,t] = RD_MaxGainPh(ph2gain, wc)
	C1 = ReteBDerivativa(a,t)
end

[m,f] = evalFdT(GX*C1, wc)
pause

bode(GX)
hold on
bode(C1)
hold on
bode(GX*C1)

[m,f] = evalFdT(GX*C1, wc)
AC = G*C*C1/(1+G*C1*C*Kh);
pole(AC)

[Gm,Pm,Wcg,Wcp] = margin(G*C*C1)
%disp("Mr in dB")
%getPeakGain(AC)-dcgain(AC)
disp("Bw")
bandwidth(AC)
figure
step(AC)
