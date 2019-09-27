I=primeint(1e5); %This calcualtes I
[p,c]=sieve(1e5); %This calculates p and c
c(1)=[]; %This removes the first entry of c because the questions asks for x to be greater than 2
Y=c.*(I.^-1); %This sets the Y values of the graph
X=2:1e5; %This sets the X values of the graph
plot(X,Y) %This plots the graph
% The graph converges towards 1