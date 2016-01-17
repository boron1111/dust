global sogouDate sogouDust
a=load('sogouDate');
b=load('sogouDust');

sogouDate=a.sogouDate;
sogouDust=b.sogouDust;

clear a b

t4=timer('timerfcn','getSogou','period',3600,'executionmode','fixedrate','busymode','queue');
start(t4);