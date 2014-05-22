function newMask = drillHole(mask, x, y)
newMask = mask;
for i = 0:2
    for j = 0:2
        newMask(x+i, y) = 0;
        newMask(x-i, y) = 0;
        newMask(x+i, y+j) = 0;
        newMask(x-i, y+j) = 0;
        newMask(x+i, y-j) = 0;
        newMask(x-i, y-j) = 0;
        newMask(x, y+j) = 0;
        newMask(x, y-j) = 0;
    end
end

end