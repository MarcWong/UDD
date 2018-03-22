path='E:\Dataset\final\';
outputpath = 'E:\Dataset\final_png\';
listing = dir([path '*.JPG']);
imgSum = length(listing);
for imgNum = 1:imgSum
    imgORI_uri = [path listing(imgNum).name];
    imgORI = imread(imgORI_uri);
    imwrite(imgORI,[outputpath strrep(listing(imgNum).name,'.JPG','.png')]);
end