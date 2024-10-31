clear all, close all

Vcc = 3.3;
Rsum = 100e3;
R1 = 1e3:1e3:99e3;
R2 = Rsum - R1;
Rf = (10e3:1e3:22e3).';

Voff = Vcc * (parallel(Rf, R2)./(parallel(Rf, R2) + R1));
Vout = (Rf + parallel(R1, R2))./parallel(R1, R2);

figure;
plot(R1, Voff)
yline(Vcc/2)
yline(2)
figure;
plot(R1, Vout)
yline(Vcc/2)
yline(2)




function Ro = parallel(R1, R2)
    Ro = (R1 .* R2)./(R1 + R2);
end
