load sogouDust
load sogouDate

sogouDates=sogouDate(1,1):1/24:sogouDate(end,end);
sogouDusts=zeros(1,length(sogouDates));
for id=1:length(sogouDates)
    ids=find(abs(sogouDate-sogouDates(id))<1e-5);
    sogouDusts(id)=mode(sogouDust(ids));
end

sogouDusts=sogouDusts(~isnan(sogouDusts));
sogouDates=sogouDates(~isnan(sogouDusts));

t=1*24;
figure;plot(sogouDusts(end-t+1:end),'.-');xlim([1,t]);ylim([0,500])

clear sogouDate sogouDust id ids t