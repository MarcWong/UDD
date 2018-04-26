%%
%label definition
%----------------------------------------%
% 0: vegetation
% 1: building
% 2: water
% 3: vehicle
% 255: other
%
%----------------------------------------%

%%
%env setup
srcpath='E:\Dataset\rawPSSD\src\';
oripath='E:\Dataset\rawPSSD\ori\';
gtpath='E:\Dataset\rawPSSD\gt\';
visualpath='E:\Dataset\rawPSSD\visualization\';
classpath='E:\Dataset\rawPSSD\gt_class\';

visual_mode = 1; %是否运行visual脚本
visual_resizerate=0.25; %对于原图可视化时间过长，可以resize较小尺寸看效果
mask_or_color = 1; %mask储存模式：1为原图像上的mask，0为只有色块
class_number = 3; %可分为3类/5类
split_mode = 1; %是否运行split脚本
split_visualmode = 0;  %是否可视化
src_prefix = '.jpg';

%%
listing = dir([srcpath '*' src_prefix]);
imgSum = length(listing);
for imgNum = 1:imgSum
    imgORI_uri = [srcpath listing(imgNum).name];
    imgB_uri = [oripath strrep(listing(imgNum).name,src_prefix,'_b.png')];
    imgT_uri = [oripath strrep(listing(imgNum).name,src_prefix,'_t.png')];
    imgV_uri = [oripath strrep(listing(imgNum).name,src_prefix,'_v.png')];
    imgW_uri = [oripath strrep(listing(imgNum).name,src_prefix,'_w.png')];
    
    imgGT_uri = [gtpath strrep(listing(imgNum).name,src_prefix,'.png')];
   
    imgVIS_uri = [visualpath strrep(listing(imgNum).name,src_prefix,'_visual_mask.png')];
    imgVIS_uri2 = [visualpath strrep(listing(imgNum).name,src_prefix,'_visual_color.png')]; 
    imgCLASS_uri = [classpath strrep(listing(imgNum).name,src_prefix,'')];
    
    %read original pic
    imgORI = imread(imgORI_uri);
    if length(size(imgORI))==3
        imgORI = rgb2gray(imgORI);
    end
    [m,n] = size(imgORI);
    
    % set ground truth
    imgGT = uint8(zeros(m,n));

    if exist(imgB_uri,'file')
        imgB = imread(imgB_uri);
        if length(size(imgB))==3
            imgB = rgb2gray(imgB);
        end
        imgB = imresize(imgB,[m n]);
        imgGT = imgGT + uint8(~imgB .* 1); % building
    end
    if exist(imgT_uri,'file')
        imgT = imread(imgT_uri);
        if length(size(imgT))==3
            imgT = rgb2gray(imgT);
        end
        imgT = imresize(imgT,[m n]);
        imgGT = imgGT + uint8(~imgT .* 2); % tree
    end
    if exist(imgV_uri,'file')
        imgV = imread(imgV_uri);
        if length(size(imgV))==3
            imgV = rgb2gray(imgV);
        end
        imgV = imresize(imgV,[m n]);
        imgGT = imgGT + uint8(~imgV .* 8); % car
    end
    if exist(imgW_uri,'file')
        imgW = imread(imgW_uri);
        if length(size(imgW))==3
            imgW = rgb2gray(imgW);
        end
        imgW = imresize(imgW,[m n]);
        imgGT = imgGT + uint8(~imgW .* 4); % water
    end
    
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
    
    if class_number == 3
        for i = 1:m
           for j = 1:n
               if imgGT(i,j) > 7 
                   imgGT(i,j) = 2;%vehicle
               elseif imgGT(i,j) > 3 
                   imgGT(i,j) = 2;%water
               elseif imgGT(i,j) > 1 
                   imgGT(i,j) = 0;%vegetation
               elseif imgGT(i,j) > 0 
                   imgGT(i,j) = 1;%building
               else
                   imgGT(i,j) = 2;%other
               end
           end
        end
    else %class_number == 5
        for i = 1:m
           for j = 1:n
               if imgGT(i,j) > 7 
                   imgGT(i,j) = 3;%vehicle
               elseif imgGT(i,j) > 3 
                   imgGT(i,j) = 2;%water
               elseif imgGT(i,j) > 1 
                   imgGT(i,j) = 0;%vegetation
               elseif imgGT(i,j) > 0 
                   imgGT(i,j) = 1;%building
               else
                   imgGT(i,j) = 255;%other
               end
           end
        end
    end
    
    % final output:
    % 3: vehicle
    % 2: water
    % 1: building
    % 0: vegetation
    imwrite(imgGT,imgGT_uri);
    %----------------------------------------%
    if visual_mode
        gtVisual(imgGT_uri,imgORI_uri,imgVIS_uri,0, visual_resizerate, class_number);
        gtVisual(imgGT_uri,imgORI_uri,imgVIS_uri2,1, visual_resizerate, class_number);
    end
    if split_mode
        gtSplit(imgGT_uri,imgCLASS_uri,split_visualmode);
    end
end