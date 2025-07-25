% Welded Beam Design Problem Version 2
function penalty = F5c(x)
penalty=0;

E = 30*10^6;
G = 12*10^6;
L=14;
P=6000;

Q=P*(14+x(2)/2);
D=sqrt(x(2)^2/4+(x(1)+x(3))^2/4);
J=2*(x(1)*x(2)*sqrt(2)*((x(2)^2)/4+((x(1)+x(3))/2)^2));
alpha=P/(sqrt(2)*x(1)*x(2));
beta=Q*D/J;
tau=sqrt(alpha^2+2*alpha*beta*x(2)/(2*D)+beta^2);
sigma=504000/(x(4)*x(3)^2);
delta = 6*P*L^3/(E*x(4)*x(3)^3);
F = (4.013*E/(6*L^2))*x(3)*x(4)^3*(1-0.25*x(3)*sqrt(E/G)/L);

y(1)=tau-13600; 
y(2)=sigma-30000;
y(3)=x(1)-x(4);
y(4)=0.125-x(1);
y(5)=delta-0.25;
y(6)=6000-F; 
y(7)=0.10471*x(1)^2+0.04811*x(3)*x(4)*(14+x(2))-5.0;


for i=1:7;
    if(y(i)>0)
        penalty=penalty+y(i)*y(i);
    end;
end
end
