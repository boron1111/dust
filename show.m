function show(x)
global dust1 dust2 p timerecord
if length(dust1)>x
    section_t=timerecord(end-x+1:end);
    plot(section_t,polyval(p,dust1(end-x+1:end))/255*5,'r-',section_t,(dust2(end-x+1:end))/255*5,'b-')
%     plot((1:x)/60,(dust1(end-x+1:end))/255*5,'r-',(1:x)/60,(dust2(end-x+1:end))/255*5,'b-')
else
    section_t=timerecord;
    plot(section_t,polyval(p,dust1)/255*5,'r-',section_t,(dust2)/255*5,'b-')
end

ylim([0.5 1.5]);
xlim([timerecord(end-x+1) timerecord(end)]);

section_1=floor(section_t(1)*24);
section_end=floor(section_t(end)*24);
ticks=(section_1:ceil((section_end-section_1)/6):section_end)/24;
ticks=ticks';
tickStrs=strcat(cellstr(num2str(month(ticks))),'.',cellstr(num2str(day(ticks))),'_',cellstr(num2str(hour(ticks))));
set(gca,'xtick',ticks,'xticklabel',tickStrs);