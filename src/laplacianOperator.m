function L=laplacianOperator(img) 
    [x, y] = size(img);
    L = zeros(x, y);
    for i = 2:x-1
        for j = 2:y-1
            L(i, j) = -4*img(i,j) +...
                         img(i+1, j) +...
                         img(i-1, j) +...
                         img(i, j+1) +...
                         img(i, j-1);
        end
    end

end