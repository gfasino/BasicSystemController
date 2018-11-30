%mloss in dB
function [alpha, tau] = RI_MaxLossMod(mloss, w)
	%-20log10(1/a) = mloss
	m = (mloss/20);
	m = 10^m;
	alpha = m^-1;
	tau = 100/w;
	end
