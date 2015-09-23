function g = sigmoidGradient(z)
%     z = [-100 -0.5 0 0.5 100];
    g = sigmoid(z).*(1-sigmoid(z));
%     fprintf('%f ', g);
end