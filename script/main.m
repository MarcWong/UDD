%%
%label definition
%----------------------------------------%
%tree: 0
%building: 1
%ground: 2
%unknown: 255, but now don't use it
%
%----------------------------------------%

%%
%env setup
srcpath='E:\Dataset\rawm1\src\';
oripath='E:\Dataset\rawm1\ori\';
gtpath='E:\Dataset\rawm1\gt\';
visualpath='E:\Dataset\rawm1\visualization\';
classpath='E:\Dataset\rawm1\gt_class\';

visual_mode = 0; %是否运行此脚本
visual_resizerate=0.25; %对于原图可视化时间过长，可以resize较小尺寸看效果
visual_writemode = 0; %是否要保存visualization的结果
split_mode = 1; %是否运行此脚本
split_visualmode = 0;  %是否可视化

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
    
    imgVIS_uri = [visualpath strrep(listing(imgNum).name,'.JPG','_visual_gt.png')];
    
    imgCLASS_uri = [classpath strrep(listing(imgNum).name,'.JPG','')];
    
    if length(size(imgB))==3
        imgB = rgb2gray(imgB);
    end
    [m, n] = size(imgB);
    %----------------------------------------%
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
    
    %----------------------------------------%
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
    %----------------------------------------%
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
    %----------------------------------------%
    if visual_mode
        gtVisual(imgGT_uri,imgORI_uri,imgVIS_uri,visual_writemode, visual_resizerate);
    end
    if split_mode
        gtSplit(imgGT_uri,imgCLASS_uri,split_visualmode);
    end
end