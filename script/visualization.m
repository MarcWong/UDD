view_mode = 0; % 0 automatic, 1 manual
visualpath='E:\Dataset\rawm1\visualization\';
listing = dir([visualpath '*.png']);
imgSum = length(listing);
for imgNum = 1:imgSum
    imgVIS_uri = [visualpath listing(imgNum).name];
    imshow(imread(imgVIS_uri),'InitialMagnification','fit');
    if view_mode
        pause();
    else
        pause(0.15);
    end
end