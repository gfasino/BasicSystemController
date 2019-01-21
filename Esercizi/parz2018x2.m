addpath('../');
s = tf('s');

G = 5/(s+10)^2
wc = 15;

Kc = 12;
Ki = Kc;
Kp = Ki/wc*100;

C = Kp+Ki/s;
%C=1;

[mi,fi] = evalFdT(G, wc)
if fi>0
	fi = fi - 360
end

ph2gain = +phMargin-fi+phEpsilon-180
phMargin = 41.0;
phEpsilon = 0;

[m,f] = evalFdT(G*C, wc)
W = C*G/(1+G*C);
bandwidth(W)

