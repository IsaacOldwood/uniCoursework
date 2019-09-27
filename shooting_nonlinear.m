function [l2,C] = shooting_nonlinear(N,c1,c2,tol)

% y''+y'+y^2-2y^3=0   y(1)=1 y(2)=1/2

% y'=v  v'=2y^3-v-y^2

%Set Starting Values
h=(2-1)/N;
C=[];
C1=c1;
C(1)=C1;
C2=c2;
C(2)=C2;
C3=(C1+C2)/2;
C(3)=C3;

%Initialise Vectors
x_vec=[];
y1_vec=[];
v1_vec=[];
y2_vec=[];
v2_vec=[];
y3_vec=[];
v3_vec=[];

%Set Starting Values
x_vec(1)=1;
y1_vec(1)=1;
y2_vec(1)=1;
y3_vec(1)=1;
k=4;
estimate3=tol+10;

%Loop Until Error is less than tol
while abs(estimate3-(1/2)) > tol
    C1;
    C2;
    C3=(C1+C2)/2;
    %Set Starting Values
    v1_vec(1)=C1;
    v2_vec(1)=C2;
    v3_vec(1)=C3;

    %Perform Euler's Method iterations
    for i=1:N
        x_vec(i+1)=x_vec(i)+h;
        y1_vec(i+1)=y1_vec(i)+h*v1_vec(i);
        v1_vec(i+1)=v1_vec(i)+h*((2*y1_vec(i)^3)-(v1_vec(i))-(y1_vec(i)^2));
        y2_vec(i+1)=y2_vec(i)+h*v2_vec(i);
        v2_vec(i+1)=v2_vec(i)+h*((2*y2_vec(i)^3)-(v2_vec(i))-(y2_vec(i)^2));
        y3_vec(i+1)=y3_vec(i)+h*v3_vec(i);
        v3_vec(i+1)=v3_vec(i)+h*((2*y3_vec(i)^3)-(v3_vec(i))-(y3_vec(i)^2));
    
    end

    %Set Final Values Of Approximates
    estimate1=y1_vec(end);
    estimate2=y2_vec(end);
    estimate3=y3_vec(end);
    
    %Set The New Value Of C1 or C2
    if (1/2)>estimate3
        C1=(C1+C2)/2;
    elseif (1/2)<estimate3
        C2=(C1+C2)/2;
    end
    
    %Plot Graph Output
    if k==4
        plot(x_vec,y1_vec,x_vec,y2_vec,x_vec,y3_vec)
        C(k)=(C1+C2)/2;
        k=k+1;
        hold on
    else
        C(k)=(C1+C2)/2;
        plot(x_vec,y3_vec)
        k=k+1;
    end
end

%Calculate Exact Solution
exact_sol=(1./x_vec);

%Plot Graph
plot(x_vec,exact_sol,'k')

%Calculate Error
error=(exact_sol-y3_vec);

%Calculate L2 Norm
l2=sqrt(h)*norm(error);

