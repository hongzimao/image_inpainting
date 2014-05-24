function imageInpaintingPDE()
input=imread('hkust.jpg');
input=rgb2gray(input);
load('mask.mat');
[x, y] = size(mask);
input = double(input);
input = input/255;
input = input>0.5; % turn into binary 
img = double(input);

% The following parameters need to be carefully tuned....
epsilon = 0.02;
lambda = 10000000; % This large value enpowers the original image to remain the same.
originalImg = img;
deltaT = 0.0001; % delta t <= min(2^2/2/epsilon, epsilon)
deltaU = zeros(x, y);
for t = 1:1000 % iteration steps
    L = laplacianOperator(img); 
    %Euler Lagrange Equation, derived from Cahn-Hilliard Equation
    deltaU = 3*epsilon*L - 1/epsilon*(4*img.^3-6*img.^2+2*img) + 2*lambda*(mask>0).*(originalImg-img);
    deltaU(isnan(deltaU))=0; % prevent NAN
    img = img + deltaT*deltaU;
end
imshow(uint8(img*255));
end