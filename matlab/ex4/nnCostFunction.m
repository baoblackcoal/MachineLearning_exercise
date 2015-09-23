function [J grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
                   num_labels, X, y, lambda)
    m = length(y);
    len_theta1 = (input_layer_size+1) * hidden_layer_size;
    theta1 = nn_params(1:len_theta1);
    theta1 = reshape(theta1, hidden_layer_size, input_layer_size+1);
    theta2 = nn_params(len_theta1+1:end);
    theta2 = reshape(theta2, num_labels, hidden_layer_size+1);
   
    a1 = X;
%     disp(size(a1));
%     disp(input_layer_size);
    a10 = [ones(m, 1) a1];
    a2 = sigmoid(a10*theta1');
%     disp(size(a2));
    a20 = [ones(m, 1) a2];
    h = sigmoid(a20*theta2');
    
    Y = zeros(m, num_labels);
    for i=1:m
       Y(i, y(i))=1; 
    end
%     disp(Y);
%     disp(y);
    cost1 = sum(sum(-Y.*log(h) - (1-Y).*log(1-h)))/m;
    
    temp1 = [zeros(size(theta1,1),1) theta1(:,2:end)];
    temp2 = [zeros(size(theta2,1),1) theta2(:,2:end)];
    temp = [temp1(:); temp2(:)];
    cost2 = lambda*sum(temp.^2)/(2*m);
    
    J = cost1 + cost2;

    
    %% 计算 Gradient 
    delta_1 = zeros(size(theta1));
    delta_2 = zeros(size(theta2));
    
    for i=1:m
       %step 1
       a1 = X(i, :)';
       a1 = [1;a1];
       z2 = theta1*a1;
       a2 = sigmoid(z2);
       a2 = [1;a2];
       z3 = theta2*a2;
       a3 = sigmoid(z3);
       %step 2    
       y_tmp = zeros(num_labels, 1);
       y_tmp(y(i)) = 1;
       err_3 = a3 - y_tmp;
       %step 3
       err_2 = theta2'*err_3;
       err_2 = err_2(2:end).*sigmoidGradient(z2);
       %step 4
       delta_2 = delta_2+err_3*a2';
       delta_1 = delta_1+err_2*a1';
    end
    %step 5
    Theta1_temp = [zeros(size(theta1,1),1) theta1(:,2:end)];
    Theta2_temp = [zeros(size(theta2,1),1) theta2(:,2:end)];
    Theta1_grad = 1 / m * delta_1 + lambda/m * Theta1_temp;
    Theta2_grad = 1 / m * delta_2 + lambda/m * Theta2_temp ;

    % Unroll gradients
    grad = [Theta1_grad(:) ; Theta2_grad(:)]; 
   

    %{
    %% 计算 Gradient 
    delta_1 = zeros(size(theta1));
    delta_2 = zeros(size(theta2));

    for t = 1:m
       % step 1
       a_1 = X(t,:)';          
           a_1 = [1 ; a_1];
       z_2 = theta1 * a_1;   
       a_2 = sigmoid(z_2);  
          a_2 = [1 ; a_2];
       z_3 = theta2 * a_2;
       a_3 = sigmoid(z_3);
       % step 2
       err_3 = zeros(num_labels,1);
       for k = 1:num_labels     
          err_3(k) = a_3(k) - (y(t) == k);
       end
       % step 3
       err_2 = theta2' * err_3;                % err_2有26行！！！
       err_2 = err_2(2:end) .* sigmoidGradient(z_2);   % 去掉第一个误差值，减少为25. sigmoidGradient(z_2)只有25行！！！
       % step 4
       delta_2 = delta_2 + err_3 * a_2';
       delta_1 = delta_1 + err_2 * a_1';
    end

    % step 5
    Theta1_temp = [zeros(size(theta1,1),1) theta1(:,2:end)];
    Theta2_temp = [zeros(size(theta2,1),1) theta2(:,2:end)];
    Theta1_grad = 1 / m * delta_1 + lambda/m * Theta1_temp;
    Theta2_grad = 1 / m * delta_2 + lambda/m * Theta2_temp ;

    % -------------------------------------------------------------

    % =========================================================================

    % Unroll gradients
    grad = [Theta1_grad(:) ; Theta2_grad(:)]; 
%}
end