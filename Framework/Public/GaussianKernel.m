function values = GaussianKernel(x)
    %GaussianKernel - Description
    %
    % Syntax: values = GaussianKernel(x)
    %
    % Long description
    sigma = 20;
    temp = pdist2(x, x);
    value = exp(-temp / (2 * sigma * sigma));
    values = sum(value);
end
