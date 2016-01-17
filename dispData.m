function dispData
x=get(gca,'currentpoint');
% if randi([0 10])<9
    disp([datestr(x(1,1)),'  ',num2str(x(1,2))]);
% else
%     disp('---------------------');
% end