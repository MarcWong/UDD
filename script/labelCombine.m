%%
%label definition
%%%%%%%%%%%%%%%%%%%%%%
%tree: 0
%building: 1
%ground: 2
%unknown: 255, but now don't use it
%
%%%%%%%%%%%%%%%%%%%%%%

%%
%env setup
srcpath='F:\Dataset\rawm1\src\';
oripath='F:\Dataset\rawm1\ori\';
gtpath='F:\Dataset\rawm1\gt\';
visualpath='F:\Dataset\rawm1\visualization\';
%%
listing = dir([srcpath '*.JPG']);
imgSum = length(listing);
for imgNum = 1:imgSum
    imgORI_uri = [srcpath listing(imgNum).name];
    %imgORI = imread(imgORI_uri);
    
    imgB_uri = [oripath strrep(listing(imgNum).name,'.JPG','_b.png')];
    imgB = imread(imgB_uri);
    imgT_uri = [oripath strrep(listing(imgNum).name,'.JPG','_t.png')];
    imgT = imread(imgT_uri);
    imgGT_uri = [gtpath strrep(listing(imgNum).name,'.JPG','.png')];
    
    imgVISUAL_uri = [visualpath strrep(listing(imgNum).name,'.JPG','_visual_gt.png')];
    if length(size(imgB))==3
        imgB = rgb2gray(imgB);
    end
    [m n] = size(imgB);
    %{
    %convert rgb to logical
    if length(size(imgB))==3
        imgB = rgb2gray(imgB);
        [m n] = size(imgB);
        if max(imgB(:))>1
            for i = 1:m
                for j = 1:n
                    if imgB(i,j) > 128
                        imgB(i,j) = 1;
                    elseif imgB(i,j) > 1
                        imgB(i,j) = 0;
                    end
                end
            end
            imgB = logical(imgB);
            %imwrite(imgB,imgB_uri);
        end
    end    
    [m n] = size(imgB);
    
    
    %convert rgb to logical
    if length(size(imgT))==3
        imgT = rgb2gray(imgT);
        if max(imgT(:))>1
            for i = 1:m
                for j = 1:n
                    if imgT(i,j) > 128
                        imgT(i,j) = 1;
                    else
                        imgT(i,j) = 0;
                    end
                end
            end
            imgT = logical(imgT);
            imwrite(imgT,imgT_uri);
        end
    end
    %}
    % set ground truth
    imgGT = uint8(zeros(m,n));
    %imshow(imgT);
    for i = 1:m
       for j = 1:n
           if imgT(i,j) == 0 %tree
               imgGT(i,j) = 0;
           elseif imgB(i,j) == 0
               imgGT(i,j) = 1;
           else
               imgGT(i,j) = 2;
           end
       end
    end
    imwrite(imgGT,imgGT_uri);
    
    gtVisual(imgGT_uri,imgORI_uri,imgVISUAL_uri, 1,0.25);
    %imagesc(imgGT);
    %imwrite(imgGT,imgGT_uri);
end