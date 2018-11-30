[a,t] = RI_MaxLossPh(45,100);
G1 = ReteBIntegrativa(a,t)
bode(G1)
hold on

[a,t] = RI_MaxLossMod(15,10000);
G2 = ReteBIntegrativa(a,t)
bode(G2)

