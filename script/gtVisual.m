%% Visualize ground truth
% mask_or_color
% 0: 可视化语义图
% 1: 可视化原图蒙版
%% Label definition
%----------------------------------------%
% 0: other 其他 着色:0,0,0
% 1: building 除房顶的建筑 imgB 后缀：_b.png 着色:102,102,156
% 2: road 道路 imgR 后缀：_r.png 着色:128,64,128
% 3: vegetation 植被 imgT 后缀：_t.png 着色:107,142,35
% 4: vehicle 车辆 imgV 后缀：_v.png 着色:0,0,142
% 5: roof 房顶 imgRoof 后缀：_roof.png 着色:70,70,70
%----------------------------------------%
%%
function gtVisual(gt_uri, src_uri, output_uri,mask_or_color, resize_rate)
    display(['%processing:' gt_uri ',processing mode:' num2str(mask_or_color)]);

    %%parameters
    %expansion_times = 0;
    %----------------------------------------%
    gtI = imread(gt_uri);
    visualI = imread(src_uri);
    if length(size(gtI))==3
        gtI = rgb2gray(gtI);
    end

    %----------------------------------------%
    gtI = imresize(gtI,resize_rate, 'nearest');
    visualI = imresize(visualI,resize_rate, 'nearest');
    
    %if max(gtImg(:))==1
    %    gtImg = uint8(gtImg).*255;
    %end
    %if expansion_times>0
    %    gtImg = expand(gtImg,128,expansion_times);
    %end
    %----------------------------------------%
    [m, n]=size(gtI);
    if mask_or_color == 0 % generate color
        for i = 1:m
            for j = 1:n
                if gtI(i,j) == 1 %building
                    visualI(i,j,1) = 102;
                    visualI(i,j,2) = 102;
                    visualI(i,j,3) = 156;
                elseif gtI(i,j) == 2 %road
                    visualI(i,j,1) = 128;
                    visualI(i,j,2) = 64;
                    visualI(i,j,3) = 128;
                elseif gtI(i,j) == 3 %vegetation
                    visualI(i,j,1) = 107;
                    visualI(i,j,2) = 142;
                    visualI(i,j,3) = 35;
                elseif gtI(i,j) == 4 %vehicle
                    visualI(i,j,1) = 0;
                    visualI(i,j,2) = 0;
                    visualI(i,j,3) = 142;
                elseif gtI(i,j) == 5 % roof
                    visualI(i,j,1) = 70;
                    visualI(i,j,2) = 70;
                    visualI(i,j,3) = 70;
                elseif gtI(i,j) == 0 % background
                    visualI(i,j,1) = 0;
                    visualI(i,j,2) = 0;
                    visualI(i,j,3) = 0;
                end
            end
        end
    else % generate mask
        for i = 1:m
            for j = 1:n
                if gtI(i,j) == 1 %building
                    visualI(i,j,1) = visualI(i,j,1) / 2 + 102;
                    visualI(i,j,2) = visualI(i,j,2) / 2 + 102;
                    visualI(i,j,3) = visualI(i,j,3) / 2 + 156;
                elseif gtI(i,j) == 2 %road
                    visualI(i,j,1) = visualI(i,j,1) / 2 + 128;
                    visualI(i,j,2) = visualI(i,j,2) / 2 + 64;
                    visualI(i,j,3) = visualI(i,j,3) / 2 + 128;
                elseif gtI(i,j) == 3 %vegetation
                    visualI(i,j,1) = visualI(i,j,1) / 2 + 107;
                    visualI(i,j,2) = visualI(i,j,2) / 2 + 142;
                    visualI(i,j,3) = visualI(i,j,3) / 2 + 35;
                 elseif gtI(i,j) == 4 %vehicle
                    %visualI(i,j,1) = 0;
                    %visualI(i,j,2) = 0;
                    visualI(i,j,3) = visualI(i,j,3) / 2 + 142;
                elseif gtI(i,j) == 5 % roof
                    visualI(i,j,1) = visualI(i,j,1) / 2 + 70;
                    visualI(i,j,2) = visualI(i,j,2) / 2 + 70;
                    visualI(i,j,3) = visualI(i,j,3) / 2 + 70;
                elseif gtI(i,j) == 0 % background
                    visualI(i,j,1) = visualI(i,j,1) / 2;
                    visualI(i,j,2) = visualI(i,j,2) / 2;
                    visualI(i,j,3) = visualI(i,j,3) / 2;
                end
            end
        end
    end
    imwrite(visualI,output_uri);
end