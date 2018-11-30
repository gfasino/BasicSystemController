function G = ReteBIntegrativa(alpha, tau)
	s = tf('s');
	G = (1+s*alpha*tau)/(1+tau*s);
	end
