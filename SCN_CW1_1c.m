%Initialise Vectors
error=[];
h=[];

%Set Start Values
error(1)=shooting_heun(10,1,2);
h(1)=(2-1)/10;

%Start Table
msg=['h','   ','Error','   ','Order Of Acuuracy'];
disp(msg);

msg=['============================='];
disp(msg);

msg=[num2str(h(1)),' ',num2str(error(1)),' ','N/A'];
disp(msg);

%Output Varied N
for i=2:13
    N=(2^(i-1))*10;
    h(i)=(2-1)/N;
    error(i)=shooting_heun(N,1,2);
end

%Add Values To Table
for k=2:12
    msg=[num2str(h(k)),' ',num2str(error(k)),' ',num2str( log2((error(k-1)-error(k))/(error(k)-error(k+1))) )];
    disp(msg);
end

%Plot The Table
plot(log10(h),log10(error))
xlabel('log10(h)')
ylabel('log10(error)')
    