function [best,bestKisit,bestParams]=compareSol(objs,objsc,seedParams,objt,objtc,treeParams)
tol=0.000000000001;

best=objt;
bestKisit=objtc;
bestParams=treeParams;

if(objsc<=tol) && (bestKisit>tol)
    best=objs;
    bestKisit=objsc;
    bestParams=seedParams;
else
    if(objsc>tol) && (bestKisit>tol)
        if(objsc<bestKisit)
            best=objs;
            bestKisit=objsc;
            bestParams=seedParams;
        end
    end
end
if(objsc<=tol) && (bestKisit<=tol)
    if(objs<=best)
        best=objs;
        bestKisit=objsc;
        bestParams=seedParams;
    end
end
