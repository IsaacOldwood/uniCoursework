%Initialise Vectors
error=[];
h=[];

%Set Starting Values
error(1)=shooting_euler(10,1,2);
h(1)=(2-1)/10;

%Start Table
msg=['h','   ','Error','   ','Order Of Acuuracy'];
disp(msg);

msg=['============================='];
disp(msg);

msg=[num2str(h(1)),' ',num2str(error(1)),' ','N/A'];
disp(msg);

%Output Varied N
for i=2:16
    N=(2^(i-1))*10;
    h(i)=(2-1)/N;
    error(i)=shooting_euler(N,1,2);
end

%Add values to the table
for k=2:15
    msg=[num2str(h(k)),' ',num2str(error(k)),' ',num2str( log2((error(k-1)-error(k))/(error(k)-error(k+1))) )];
    disp(msg);
end
    