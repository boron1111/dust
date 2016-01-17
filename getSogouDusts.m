sogouDates=sogouDate(1,1):1/24:sogouDate(end,end);
sogouDusts=zeros(1,length(sogouDates));
dust1_mean=zeros(1,length(sogouDates));
dust2_mean=zeros(1,length(sogouDates));
for id=1:length(sogouDates)
    ids=find(abs(sogouDate-sogouDates(id))<1e-5);
    sogouDusts(id)=mean(sogouDust(ids));
    a=find(timerecord>sogouDates(id)-1/48);
    b=find(timerecord<sogouDates(id)+1/48);
    dust1_mean(id)=mean(dust1(a(1):b(end)));
    dust2_mean(id)=mean(dust2(a(1):b(end)));
end

% sogouDates=sogouDates(~isnan(sogouDusts));
sogouDusts=sogouDusts(~isnan(sogouDusts));

% figure;plot(sogouDates,sogouDusts);
% % figure;plot(sogouDates,dust2_mean);

% figure;plot(sogouDusts,dust1_mean,'.-');
% figure;plot(sogouDusts,dust2_mean,'.-');

t=1*24;
figure;plot(sogouDusts(end-t+1:end),'.-');xlim([1,t]);ylim([0,500])

% figure;plot(sogouDates,sogouDusts,'.-');ylim([0,500])
% disp(mean(sogouDusts))

clear id ids a b sogouDates sogouDusts dust1_mean dust2_mean