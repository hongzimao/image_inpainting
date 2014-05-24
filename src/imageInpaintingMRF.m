function imageInpaintingMRF()
input=imread('test.jpg');
input=rgb2gray(input);
load('mask.mat');
[x, y] = size(mask);
input = double(input);
for i = 1:x
    for j = 1:y
        if mask(i, j) == 0
           %input(i, j) = (input(i-1, j)*mask(i-1, j) + input(i+1, j)*mask(i+1, j) + input(i, j+1)*mask(i, j+1) + input(i, j-1)*mask(i, j-1))/(mask(i-1, j)+mask(i+1, j)+mask(i, j-1)+mask(i, j+1));
           %input(i, j) = globalLookingMinError(mask, input, i, j, x, y, 0);
           %input(i, j) = globalLookingMedianIntensity(mask, input, i, j, x, y, 10);
           input(i, j) = globalLookingAverage(mask, input, i, j, x, y, 10);
        end
        mask(i,j)=1;
    end
    disp(i/x);
end

temp = input;
load('mask.mat');
for j = y:-1:1
    for i = x:-1:1
        if mask(i, j) == 0
           %input(i, j) = (input(i-1, j)*mask(i-1, j) + input(i+1, j)*mask(i+1, j) + input(i, j+1)*mask(i, j+1) + input(i, j-1)*mask(i, j-1))/(mask(i-1, j)+mask(i+1, j)+mask(i, j-1)+mask(i, j+1));
           %input(i, j) = globalLookingMinError(mask, input, i, j, x, y, 0);
           %input(i, j) = globalLookingMedianIntensity(mask, input, i, j, x, y, 10);
           input(i, j) = globalLookingAverage(mask, input, i, j, x, y, 10);
        end
        mask(i,j)=1;
    end
    disp((y-j)/y);
end
input = (temp+input)/2;
input = uint8(input);
imshow(input);

end