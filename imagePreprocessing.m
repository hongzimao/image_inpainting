function imagePreprocessing() % Defined inpainting region
input=imread('hkust.jpg');
input=rgb2gray(input);
[img.X, img.Y, img.RGB] = size(input);
mask = ones(img.X, img.Y);
canvas.figure= figure;
imshow(input);
switching = false;
hold on

set(canvas.figure, 'WindowButtonDownFcn', @Switch);
set(canvas.figure, 'WindowButtonMotionFcn', @Draw);

    function Switch(varargin)
        if switching == true
            switching = false;
        else
            switching = true;
        end
    end
    
    function Draw(varargin)
        if switching == true
            pt = get(gca, 'CurrentPoint');
            x=round(pt(1,1));
            y=round(pt(1,2));
            scatter(x, y,20,'red','fill');
            mask = drillHole(mask, y, x);
            save('mask.mat', 'mask');
        end
    end

end