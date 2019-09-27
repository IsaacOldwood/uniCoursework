function [p,c] = sieve(N)

B=floor(sqrt(N)); %Using a sieve, only the multiples up to the square root of N need to be removed
T=ones(1,N); %Creates a vector with 1 row and N columns

T(1)=0; %Sets the first value (1) to 0 since 1 is not a prime number
    for b=2:B %Makes the loop use all the values between 2 and the square root of N
        
        T(2*b:b:N)=0; %Sets all the none-prime values of N to 0
        
    end
p=find(T); %Pulls out all the non-zero values in T
c=cumsum(T); %Adds up all the values of T to show how many primes there are
end