visualpath='G:\Dataset\rawUDDnew\visualization\';
view_mode = 0; % 0 automatic, 1 manual
listing = dir([visualpath '*_color.png']);
imgSum = length(listing);
for imgNum = 1:imgSum
    imgVIS_uri = [visualpath listing(imgNum).name];
    imshow(imread(imgVIS_uri),'InitialMagnification',100);
    if view_mode
        pause();
    else
        pause(0.5);
    end
end