%mgain in dB
function [alpha, tau] = RD_MaxGainMod(mgain, w)
	%20log10(1/a) = mgain
	m = (mgain/20);
	m = 10^m;
	alpha = m^-1;
	tau = 100/w;
	end
