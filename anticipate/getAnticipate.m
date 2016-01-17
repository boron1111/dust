a=inputdlg;
b=urlread(a{1});
c=regexpi(b,'http://[a-zA-Z0-9./?]+wx_fmt=gif','match');
datestr=regexpi(b,'>[0-9]+-[0-9]+-[0-9]+<','match');
filename=[num2str(datenum(datestr{1}(2:end-1))),'.gif'];
urlwrite(c{1},filename);
load('colormap.mat');

% filename='736328.gif';
info=imfinfo(filename);
x=zeros(length(info),1);
y=zeros(length(info),1);
for id=1:length(info);
    [d,e]=imread(filename,'frames',id);
    if id==1;imshow(d,e);drawnow;end
    disp(id);
    b=d(264:265,349:350);
    x(id)=mode(double(b(:)))+1;
    e_id=ones(8,1)*e(x(id),:);
    z=(e_id-map).^2;
    z=sum(z,2);
%     figure;plot(z,'.-');ylim([0 2])
%     figure;image(b);colormap(e)
    y(id)=find(z==min(z));
end
% figure;plot(x,'.-')
figure('name',datestr{1}(2:end-1));plot(y,'.-')
set(gca,'ylim',[1 8],'xtick',1:8:56,'xlim',[1 56]);