[a,t] = RD_MaxGainPh(45,100);
G1 = ReteBDerivativa(a,t)
bode(G1)
hold on

[a,t] = RD_MaxGainMod(15,10000);
G2 = ReteBDerivativa(a,t)
bode(G2)

