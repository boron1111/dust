% stop(t2)
b=find(timerecord>datenum(2015,12,20,9,0,0));
c=find(timerecord>datenum(2015,12,23,9,0,0));
b=b(1);
c=c(1);
subplot(2,1,1)
plot(timerecord(b:c),polyval(p,dust2(b:c))/255*5,'b-',timerecord(b:c),(dust1(b:c))/255*5,'r-')
ylim([0 1])
xlim([timerecord(b) timerecord(c)]);

section_1=floor(timerecord(b)*24);
section_end=floor(timerecord(c)*24);
ticks=(section_1:ceil((section_end-section_1)/6):section_end)/24;
ticks=ticks';
tickStrs=strcat(cellstr(num2str(month(ticks))),'.',cellstr(num2str(day(ticks))),'_',cellstr(num2str(hour(ticks))));
set(gca,'xtick',ticks,'xticklabel',tickStrs);

subplot(2,1,2)
plot(timerecord(b:c),(polyval(p,dust2(b:c))-dust1(b:c))/255*5,'g-')
xlim([timerecord(b) timerecord(c)]);
set(gca,'xtick',ticks,'xticklabel',tickStrs);

clear b c section_h ticks tickStrs

% start(t2)