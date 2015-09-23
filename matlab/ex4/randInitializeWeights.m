function W = randInitializeWeights(input_layer_size, output_layer_size)
    % Randomly initialize the weights to small values
    epsilon_init = 0.12;
    W = rand(output_layer_size, 1 + input_layer_size)*2*epsilon_init - epsilon_init;
end