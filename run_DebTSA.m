pop=[20 40];
STs=[0.5 0.2];
max_fess=[10000 30000 50000 100000 200000];
maxrun=30;

% F1=Pressure Vessel Design Problem Region 1
% F2=Welded Beam Design Problem Version 1
% F3=Tension-Compression String Problem 
% F4=Pressure Vessel Design Problem Region 2
% F5=Welded Beam Design Problem Version 2
% F6=Pressure Vessel Design Problem Region 3

F={'F1','F2','F3','F4','F5','F6'};
Ds=[4 4 3 4 4 4];
C={'F1c','F2c','F3c','F4c','F5c','F6c'};

for p=1:2
    n=pop(p);
    ST=STs(p);
    low=round(n*0.1);
    high=round(n*0.25); 
    for f=1:5
        max_fes=max_fess(f);
        for fun=6:6
            D=Ds(fun);
            [bestSol bestParams]=DebTSA(maxrun,fun,n,low,high,D,ST,strjoin(F(fun)),strjoin(C(fun)),max_fes)
        end
    end
end