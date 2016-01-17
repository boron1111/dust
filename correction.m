a=load('p');
global p
p=a.p;
length1=3*24*60;
d1=dust1(end-length1:end);d2=dust2(end-length1:end);
x=ones(length1/60,1)*60;
c1=mat2cell(d1(1:length1),x,1);
c2=mat2cell(d2(1:length1),x,1);
for i=1:length1/60;e1(i)=mean(c1{i});end
for i=1:length1/60;e2(i)=mean(c2{i});end
plot(e2,e1,'.')
p=[p;[polyfit(e2,e1,1),now]];
save 'p' p
p=p(end,1:2);
hold on
plot(e2,polyval(p,e2),'.-')
hold off
clear ans a b c c1 c2 d1 d2 e1 e2 i
clear x