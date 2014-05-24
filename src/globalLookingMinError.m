function result = globalLookingMinError(mask, input, I, J, x, y, threshold)
result = 0;
errorMax = 255^2 * 4;
for i = 2:x-1
   for j = 2:y-1
       error = (input(I-1, J)-input(i-1,j))^2*mask(I-1, j) +...
            (input(I+1, J)-input(i+1, j))^2*mask(I+1, j) +...
             (input(I, J+1)-input(i, j+1))^2*mask(I, j+1) +...
              (input(I, J-1)-input(i, j-1))^2*mask(I, j-1);
          
      if(i~=I || j~=J)
         if(error < errorMax) 
            result = input(i,j);
            errorMax = error;
         end
      end
    end
end
end