function output = globalLookingMedianIntensity(mask, input, I, J, x, y, threshold)
result = [];
for i = 2:x-1
   for j = 2:y-1
       error = (input(I-1, J)-input(i-1,j))^2*mask(I-1, j) +...
            (input(I+1, J)-input(i+1, j))^2*mask(I+1, j) +...
             (input(I, J+1)-input(i, j+1))^2*mask(I, j+1) +...
              (input(I, J-1)-input(i, j-1))^2*mask(I, j-1);
          
        if error <= threshold
          if(i==I && j==J)
             result = [result, input(i-1, j)*mask(i-1, j), input(i+1, j)*mask(i+1, j), input(i, j+1)*mask(i, j+1), input(i, j-1)*mask(i, j-1)]; 
          else
             result = [result, input(i,j)];
          end
        end
    end
end
result(result==0) = [];
output = median(result);
end