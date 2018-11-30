function [mod, ph] = evalFdT(G, w)
	val = freqresp(G,w);
	mod = 20*log10(abs(val));
	ph  = atan2(imag(val), real(val))*180/pi;
end
