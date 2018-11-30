function G = ReteBDerivativa(alpha, tau)
	s = tf('s');
	G = (1+tau*s)/(1+s*alpha*tau);
	end
