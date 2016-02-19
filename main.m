% javaaddpath('dust.jar');

global dust1 dust2 timerecord p errorlog
a=load('dust1');
b=load('dust2');
c=load('timerecord');
d=load('p');
dust1=a.dust1;
dust2=b.dust2;
timerecord=c.timerecord;
p=d.p;
p=p(end,1:2);

clear a b c d

global dust
% dust=mcuCom.Dust;
dust=serial('com9');
set(dust,'baudrate',115200);
fopen(dust);

t1=timer('timerfcn','getdust','period',60,'executionmode','fixedrate');
start(t1);

t3=timer('timerfcn','watchDog(t1)','period',60,'executionmode','fixedrate');
errorlog=[];
start(t3);

% stop(t1);
% clear t1;
% fclose(dust);
% delete(dust);
% stop(t2);
% clear t2;