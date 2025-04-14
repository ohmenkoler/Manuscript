x = readtable("Plasma.txt");
y = x{:,:}/256;

for yi = 1:height(x)
    Y(yi,:) = ['(' num2str(y(yi,1)) ',' num2str(y(yi,2)) ',' num2str(y(yi,3)) ')'];
end
