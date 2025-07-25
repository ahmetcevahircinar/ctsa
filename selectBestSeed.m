function [bestSeed,bestSeedKisit,bestSeedParams]=selectBestSeed(ns,objs,objsc,seeds)
tol=0.000000000001;

bestSeed=objs(1);
bestSeedKisit=objsc(1);
bestSeedParams=seeds(1,:);

for j=2:ns
    if(objsc(j)<=tol) && (bestSeedKisit>tol)
        bestSeed=objs(j);
        bestSeedKisit=objsc(j);
        bestSeedParams=seeds(j,:);
    else
        if(objsc(j)>tol) && (bestSeedKisit>tol)
            if(objsc(j)<bestSeedKisit)
                bestSeed=objs(j);
                bestSeedKisit=objsc(j);
                bestSeedParams=seeds(j,:);
            end
        end
    end;
    if(objsc(j)<=tol) && (bestSeedKisit<=tol)
        if(objs(j)<=bestSeed)
            bestSeed=objs(j);
            bestSeedKisit=objsc(j);
            bestSeedParams=seeds(j,:);
        end
    end;
end;