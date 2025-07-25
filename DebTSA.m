function [best bestParams]=DebTSA(maxrun,fun,n,low,high,D,ST,objfun,confun,max_fes)

switch fun
    case 1
        dmin=[0.0625 0.0625 10 10]; % Region 1
        dmax=[6.1875 6.1875 200 200]; % Region 1
    case 2
        dmin=[0.1 0.1 0.1 0.1]; % Version 1
        dmax=[2 10 10 2]; % Version 1
    case 3
        dmin=[0.05 0.25 2];
        dmax=[2 1.3 15];
    case 4
        dmin=[0.0625 0.0625 10 10]; % Region 2
        dmax=[6.1875 6.1875 200 240]; % Region 2
    case 5
        dmin=[0.1 0.1 0.1 0.1]; % Version 2
        dmax=[2 10 10 2]; % Version 2
    case 6
        dmin=[1.125 0.625 0 0]; % Region 3
        dmax=[12.5 12.5 240 240]; % Region 3
end

iterasyonlar=zeros(maxrun,max_fes/n);
minimums=zeros(1,maxrun);
bestlerrun=zeros(maxrun,D);
herrunmaxiter=zeros(1,maxrun);

for rx=1:maxrun
    fes=n;
    trees=zeros(n,D);
    objt=zeros(1,n);
    objtc=zeros(1,n);
    
    for i=1:n
        for j=1:D
            trees(i,j)=dmin(j)+(dmax(j)-dmin(j))*rand;
        end;
        objt(i)=feval(objfun,trees(i,:));
        objtc(i)=feval(confun,trees(i,:));
    end;
    
    [best,kisit,bestParams]=SelectBest(objt,objtc,trees,n);
    
    k=1;
    say=1;
    
    while(fes<max_fes)
        for i=1:n
            ns=fix(low+(high-low)*rand)+1;
            if(ns>high)
                ns=high;
            end;
            seeds=zeros(ns,D);
            objs=zeros(1,ns);
            objsc=zeros(1,ns);
            
            for j=1:ns
                r=fix(rand*n)+1;
                while(i==r)
                    r=fix(rand*n)+1;
                end
                seeds(j,:)=trees(j,:);
                for d=1:D
                    if(rand<ST)
                        seeds(j,d)=trees(i,d)+(bestParams(d)-trees(r,d))*((rand*2)-1);
                        if(seeds(j,d)>dmax(d))
                            seeds(j,d)=dmin(d)+(dmax(d)-dmin(d))*rand;
                        end;
                        if(seeds(j,d)<dmin(d))
                            seeds(j,d)=dmin(d)+(dmax(d)-dmin(d))*rand;
                        end;
                    else
                        seeds(j,d)=trees(i,d)+(trees(i,d)-trees(r,d))*((rand*2)-1);
                        if(seeds(j,d)>dmax(d))
                            seeds(j,d)=dmin(d)+(dmax(d)-dmin(d))*rand;
                        end;
                        if(seeds(j,d)<dmin(d))
                            seeds(j,d)=dmin(d)+(dmax(d)-dmin(d))*rand;
                        end;
                    end;
                end;
                objs(j)=feval(objfun,seeds(j,:));
                objsc(j)=feval(confun,seeds(j,:));
            end;
            [bestSeed,bestSeedkisit,bestSeedParams]=selectBestSeed(ns,objs,objsc,seeds);
            
            [objt(i),objtc(i),trees(i,:)]=compareSol(bestSeed,bestSeedkisit,bestSeedParams,objt(i),objtc(i),trees(i,:));
            
            fes=fes+ns;
        end;
        [best,kisit,bestParams]=SelectBest(objt,objtc,trees,n);
        iterasyonlar(rx,k)=best;
        say=say+1;
        k=k+1;
        fprintf('objfun=%s.. Run=%d..Fes=%d..Iter=%d..min=%g\n',objfun,rx,fes,k,best);
        
    end;
    herrunmaxiter(rx)=k;
    if say<max_fes/n
        iterasyonlar(rx,say:max_fes/n)=best;
    end
    minimums(rx)=best;
    bestlerrun(rx,:)=bestParams;
end;
dosya = ['output/' mfilename,'_',objfun,'_N' num2str(n),'_D' num2str(D),'_ST' num2str(ST),'_FEs' num2str(max_fes),'.xlsx'];

iterasyonlar=iterasyonlar(:,1:max(herrunmaxiter));
ortiterasyon=mean(iterasyonlar);

iterfilename = ['output/' mfilename,'_',objfun,'_N' num2str(n),'_D' num2str(D),'_ST' num2str(ST),'_FEs' num2str(max_fes),'_iters.mat'];
ortiterfilename = ['output/' mfilename,'_',objfun,'_N' num2str(n),'_D' num2str(D),'_ST' num2str(ST),'_FEs' num2str(max_fes),'_ortiter.mat'];
bestlerrunfilename = ['output/' mfilename,'_',objfun,'_N' num2str(n),'_D' num2str(D),'_ST' num2str(ST),'_FEs' num2str(max_fes),'_bestlerrun.mat'];

save(iterfilename,'iterasyonlar');
save(ortiterfilename,'ortiterasyon');
save(bestlerrunfilename,'bestlerrun');

ort=mean(minimums);
eniyi=min(minimums);
enkotu=max(minimums);
sapma=std(minimums);
medyan=median(minimums);

xlswrite(dosya,eniyi,1,strcat('A',int2str(1)));
xlswrite(dosya,enkotu,1,strcat('B',int2str(1)));
xlswrite(dosya,ort,1,strcat('C',int2str(1)));
xlswrite(dosya,sapma,1,strcat('D',int2str(1)));
xlswrite(dosya,medyan,1,strcat('E',int2str(1)));