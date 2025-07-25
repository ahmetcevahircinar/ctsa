% Pressure Vessel Design Problem Region 2
function penalty = F4c(x)
penalty=0;
y(1) = -x(1)+0.0193*x(3);
y(2) = -x(2)+0.00954*x(3);
y(3) = -pi*x(3)^2*x(4)-(4/3)*pi*x(3)^3+1296000;
y(4) = x(4)-240;
for i=1:4;
    if(y(i)>0)
        penalty=penalty+y(i)*y(i);
    end;
end
end