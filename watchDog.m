function watchDog(t1)
    global dust dust1 dust2 timerecord errorlog
    W1=dust.ValuesSent==dust.ValuesReceived/100;
    W2=dust.BytesAvailable==0;
    W3=~(length(timerecord)==length(dust1)==length(dust2));
    error=[W1 W2 W3 now];
    if ~(W1 && W2 && W3)
        errorlog=[errorlog;error];
        if strcmp(get(t1,'running'),'on')
            stop(t1);
        end
        minOfRecord=min([length(timerecord) length(dust1) length(dust2)])-1;
        timerecord=timerecord(1:minOfRecord);
        dust1=dust1(1:minOfRecord);
        dust2=dust2(1:minOfRecord);
        fclose(dust);
        fopen(dust);
        start(t1);
    end