%Initialise Vectors
error=[];
h=[];

%Set Starting Vectors
error(1)=shooting_nonlinear(10,-2,1,0.01);
h(1)=(2-1)/10;

%Start Table
msg=['h','   ','Error','   ','Order Of Acuuracy'];
disp(msg);

msg=['============================='];
disp(msg);

msg=[num2str(h(1)),' ',num2str(error(1)),' ','N/A'];
disp(msg);

%Output Varying Values Of N
for i=2:17
    N=(2^(i-1))*10;
    h(i)=(2-1)/N;
    error(i)=shooting_nonlinear(N,-2,1,0.01);
end

%Add Values To Table
for k=2:16
    msg=[num2str(h(k)),' ',num2str(error(k)),' ',num2str( log2((error(k-1)-error(k))/(error(k)-error(k+1))) )];
    disp(msg);
end
    