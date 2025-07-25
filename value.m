for i=1:30
    f(i)=F6(bestlerrun(i,:));
end
[min minindex]=min(f);
minParams=bestlerrun(minindex,:)
