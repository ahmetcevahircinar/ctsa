% Tension-Compression String Problem
function penalty = F3c(x)
penalty=0;
y(1) = 1-(x(2)^3*x(3))/(71785*x(1)^4);
y(2) = (4*x(2)^2-x(1)*x(2))/(12566*(x(2)*x(1)^3-x(1)^4))+1/(5108*x(1)^2)-1;
y(3) = 1-140.45*x(1)/(x(3)*x(2)^2);
y(4) = (x(1)+x(2))/1.5-1;
for i=1:4;
    if(y(i)>0)
        penalty=penalty+y(i)*y(i);
    end;
end