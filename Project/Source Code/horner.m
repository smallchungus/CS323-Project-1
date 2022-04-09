function horner (file)
clear
%FILENAME = 'HornerTest1.txt';
%FILENAME = 'HornerTest2.txt';
%FILENAME = 'HornerTest3.txt';
%FILENAME = 'HornerTest4.txt';
FILENAME = 'HornerTest5.txt';

%check if we typed in the correct file name
if  exist (FILENAME,'file') == 1
   disp('You typed in the wrong filename')
else

%open data file and read from it
%replace data1 with other data files.

openData = fopen(FILENAME);
data = fscanf(openData,'%f');
fclose(openData);

%first number is n, the highest degree polynomial
%then list of coefficients in increasing order
%then xo the divider

%n is the first number
n  = data(1) + 1;


% this is the array of coeffs
a = zeros();
for i = 1:n
   a(i) = data(n+2-i);
%  fprintf('%g ', a(i));
end


% this is the number we divide by
divider = data(numel(data));

if i == 0 
    disp ('P(0) = 0');
elseif i == 1 
    disp ('P(0) = 0');
else


%a is the vector of coefficients 
% divider is the number we divide with 
% returns remainder which is the remainder after synt division 
% count is used to keep track of factorial multiplication

%a = [1, -2, -10, 1, 4];
%divider = 2;
%n = 5;
coeff = zeros(n,1); 
coeff(1) = a(1);
count = 0;
for i = n:-1:2
    for k=2:1:n
        coeff(k)=a(k)+coeff(k-1)*divider;
%        fprintf('%g ', coeff);
    end
    remainder = coeff(i)*factorial(count);
    count = count + 1; 
    a = coeff(1:n);
    fprintf('P(%d) = %f \n', count, remainder);
%    fprintf('The vector coefficient is: [');
%    fprintf('%g ', coeff);
%    fprintf(']\n');

end

end
end
