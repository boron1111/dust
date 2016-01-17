function getSogou
    global sogouDate sogouDust    
    try
        a=urlread('http://www.sogou.com/sogou?pid=AQktG&ie=utf8&query=%E5%8C%97%E4%BA%AC%E7%A9%BA%E6%B0%94');
        b=regexpi(a,'\["20[0-9-]+ [0-9]+:[0-9]+","[0-9]+"\]','match');
        c=cell(1,24);
        d=zeros(1,24);
        e=zeros(1,24);
        for i=1:24
            c{i}=regexpi(b{i},'"\w*-\w*-\w* \w*:\w*"','match');
            d(i)=datenum(c{i});
            e_s=regexpi(b{i},'"\d+"','match');
            if isempty(e_s);e_s{1}='"0"';end
            e(i)=str2double(e_s{1}(2:end-1));
        end
    catch e
        disp(e)
        return;
    end
    sogouDate=[sogouDate d'];
    sogouDust=[sogouDust e'];
    save 'sogouDate' sogouDate
    save 'sogouDust' sogouDust