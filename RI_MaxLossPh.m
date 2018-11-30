%ploss in degree
function [alpha, tau] = RI_MaxLossPh(ploss, w)
	alpha = (1-sind(ploss))/(1+sind(ploss));
	tau = 1/(w*sqrt(alpha));
	end
