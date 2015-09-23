function plotData(X, y)
%     x = [1, 2]; %for test
%     y = [3, 4];
    
    plot(X, y, 'xr', 'Markersize', 10);
    ylabel('profit in $10,000s');
    xlabel('population of City in 10,000s');
end