javaaddpath('dust.jar');

global dust1 dust2 timerecord
a=load('dust1');
b=load('dust2');
c=load('timerecord');
dust1=a.dust1;
dust2=b.dust2;
timerecord=c.timerecord;

clear a b c

global dust
dust=mcuCom.Dust;

t1=timer('timerfcn','getdust_jar','period',60,'executionmode','fixedrate');
start(t1);

% stop(t1);
% clear t1;
% dust.closeConnect
% stop(t2);
% clear t2;