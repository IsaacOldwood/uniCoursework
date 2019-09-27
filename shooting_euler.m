function [l2,alpha1, alpha2] = shooting_euler(N,c1,c2)

%Problem: x^2 y''+ 4xy'+2y=e^x   y(1)=e y(2)=(e^2)/4    
%Exact Solution: y=(x^-2)(e^x)

%New Problem y'=v v'=((e^x)-2y-4xy')/(x^2)
% v(0)=y'(0) => v(1)=c1 or v(1)=c2

%y(x_n+1)=y(x_n)+h*v(x_n)
%v(x_n+1)=v(x_n)+h*(((e^x)-2y(x_n)-4xv(x_n))/(x^2))

%Calculate h
h=(2-1)/(N);

%Initialise Vectors
x_vec=[];
y1_vec=[];
v1_vec=[];
y2_vec=[];
v2_vec=[];

%Set Starting Values
x_vec(1)=1;
y1_vec(1)=exp(1);
v1_vec(1)=c1;
y2_vec(1)=exp(1);
v2_vec(1)=c2;


%Perform Euler's Metod iterations
for i=1:N
    x_vec(i+1)=x_vec(i)+h;
    y1_vec(i+1)=y1_vec(i)+h*v1_vec(i);
    v1_vec(i+1)=v1_vec(i)+h*((exp(x_vec(i))-4*x_vec(i)*v1_vec(i)-2*y1_vec(i))/(x_vec(i)^2));
    y2_vec(i+1)=y2_vec(i)+h*v2_vec(i);
    v2_vec(i+1)=v2_vec(i)+h*((exp(x_vec(i))-4*x_vec(i)*v2_vec(i)-2*y2_vec(i))/(x_vec(i)^2));
end

%Calculate Exact SOluton
exact_sol=(x_vec.^-2).*(exp(x_vec));

%Calculate alpha Values

%eqn1= alpha1 + alpha2 == 1;
%eqn2= alpha1*y1_vec(end) + alpha2*y2_vec(end) == exact_sol(end);

A=[1,1;y1_vec(end),y2_vec(end)];
b=[1;exact_sol(end)];
sol=A\b;
alpha1=sol(1);
alpha2=sol(2);

%Use Alphas To Calculate Final Approx Of y
y_approx=alpha1.*y1_vec + alpha2 .* y2_vec;
v_approx=alpha1.*v1_vec + alpha2 .* v2_vec;

%Calculate Error
error=(exact_sol-y_approx);

%Calculate l^2 norm
l2=sqrt(h).* norm(error);

%Plot The Graph
plot(x_vec,y1_vec,'obl',x_vec,y2_vec,'obl',x_vec,exact_sol,'k',x_vec,y_approx,'r')
xlim([1,2.5])
legend('y1','y2','Exact','Approx')

%Output Message
msg=['Alpha 1 =',num2str(alpha1),' Alpha 2 =',num2str(alpha2),' L^2 Norm of Error =',num2str(l2)];
disp(msg)