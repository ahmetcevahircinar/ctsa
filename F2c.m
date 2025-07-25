% Welded Beam Design Problem Version 1
function penalty = F2c(x)
penalty=0;

load = 6000;
length =14;
modulusE = 30e6;
modulusG = 12e6;
tmax = 13600;
sigmamax = 30000;
delmax = 0.25;

tdash = load/(sqrt(2)*x(1)*x(2));
R = sqrt( x(2)*x(2)/4 + ((x(1)+x(3))/2)^2 );
M = load*(length + x(2)/2);
J = 2* ( (x(1)*x(2)/sqrt(2)) * (x(2)^2/12 + ((x(1)+x(3))/2)^2) );
tdashdash = M*R/J;
tx = sqrt( tdash^2 + 2*tdash*tdashdash*x(2)/(2*R) + tdashdash^2 );
sigmax = 6*load*length/(x(4)*x(3)^2);
delx = 4*load*length^3/(modulusE*x(4)*x(3)^3);
pcx = (4.013*sqrt( modulusE*modulusG*x(3)^2*x(4)^6/36 )/(length^2)) * ( 1- (x(3)/(2*length))*sqrt(modulusE/(4*modulusG)) );

y(1) = tx-tmax;
y(2) = sigmax-sigmamax;
y(3) = x(1) - x(4);
y(4) = 0.125 - x(1);
y(5) = delx-delmax;
y(6) = load-pcx;

for i=1:6;
    if(y(i)>0)
        penalty=penalty+y(i)*y(i);
    end;
end
end
