for id=1:128
    c_id=ones(128,1)*c(id,:);
    z=(c_id-b).^2;
    z=sum(z,2);
%     figure;plot(c)
    t(id)=find(z==min(z));
end