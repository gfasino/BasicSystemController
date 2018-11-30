%pgain in degree
function [alpha, tau] = RD_MaxGainPh(pgain, w)
	alpha = (1-sind(pgain))/(1+sind(pgain));
	tau = 1/(w*sqrt(alpha));
	end
