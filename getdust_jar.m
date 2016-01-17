function getdust_jar
global dust1 dust2 dust timerecord
dustarray1=double(dust.getDust(1));
dustarray2=double(dust.getDust(2));
dustarray1=sort(dustarray1);
dustarray2=sort(dustarray2);
% dust1=[dust1;mean(dustarray1(11:90))];
% dust2=[dust2;mean(dustarray2(11:90))];
dust1=[dust1;mean(dustarray1(11:90))];
dust2=[dust2;mean(dustarray2(11:90))];
timerecord=[timerecord;now];
save 'dust1' dust1
save 'dust2' dust2
save 'timerecord' timerecord
% if mean(dustarray1(11:90))>30
%     assignin('base','abnormal',dustarray1)
% end
% if mean(dustarray2(11:90))>35
%     assignin('base','abnormal',dustarray2)
% end