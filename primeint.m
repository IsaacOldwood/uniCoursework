function I=primeint(N)

I=1:N-1; %This sets the size of the vector to N-1

for i=1:N-1 %This creates another vector the same size as I
    k=integral(@(s)(log(s)).^-1,2,i+1); %This calculates the integral in the question
  I(I==i)=k; %This sets each value of the vector I to the integral asked in the question.
end
end