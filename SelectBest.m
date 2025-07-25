function [best,bestKisit,bestParams] = SelectBest(objt,objtc,tree,n)
tol=0.000000000001;

best=objt(1);
bestKisit=objtc(1);
bestParams=tree(1,:);

for j=2:n
    if(objtc(j)<=tol) && (bestKisit>tol)
        best=objt(j);
        bestKisit=objtc(j);
        bestParams=tree(j,:);
    else
        if(objtc(j)>tol) && (bestKisit>tol)
            if(objtc(j)<bestKisit)
                best=objt(j);
                bestKisit=objtc(j);
                bestParams=tree(j,:);
            end
        end
    end;
    if(objtc(j)<=tol) && (bestKisit<=tol)
        if(objt(j)<=best)
            best=objt(j);
            bestKisit=objtc(j);
            bestParams=tree(j,:);
        end
    end;
end;
