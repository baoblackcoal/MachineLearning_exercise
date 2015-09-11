function r = sigmoid(x)
      r = 1./(1+exp(-x));
end
% 
% function sigmoid()
%     fprintf('sigmoid(0)=%f\n', sigmoidProcess(0));
%     fprintf('sigmoid(-10)=%f\n', sigmoidProcess(-10));
%     fprintf('sigmoid(10)=%f\n', sigmoidProcess(10));    
% end
% 
% function r = sigmoidProcess(x)
%     r = 1/(1+exp(-x));
% end