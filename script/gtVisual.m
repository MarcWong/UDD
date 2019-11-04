%% Visualize ground truth
% mask_or_color
% 0: 可视化语义图
% 1: 可视化原图蒙版
%% Label definition
%----------------------------------------%
% 0: vegetation 植被 imgT 后缀：_t.png
% 1: building 建筑 imgB 后缀：_b.png
% 2: road 道路 imgR 后缀：_r.png
% 3: vehicle 车辆 imgV 后缀：_v.png
% 13: other 其他
%----------------------------------------%
%%
function out = gtVisual(gt_uri, src_uri, output_uri,mask_or_color, resize_rate)
    display(['%processing ' gt_uri]);
    %%parameters
    %expansion_times = 0;

    %----------------------------------------%
    gtI = imread(gt_uri);
    visualI = imread(src_uri);
    if length(size(gtI))==3
        gtI = rgb2gray(gtI);
    end
    
    %----------------------------------------%
    gtI = imresize(gtI,resize_rate);
    visualI = imresize(visualI,resize_rate);
    
    %if max(gtImg(:))==1
    %    gtImg = uint8(gtImg).*255;
    %end
    %if expansion_times>0
    %    gtImg = expand(gtImg,128,expansion_times);
    %end
    %----------------------------------------%
    [m n]=size(gtI);
    if mask_or_color == 0 % generate color
        for i = 1:m
            for j = 1:n;
                if gtI(i,j) == 0 %tree  green
                    visualI(i,j,1) = 0;
                    visualI(i,j,2) = 255;
                    visualI(i,j,3) = 0;
                elseif gtI(i,j) == 1 %building  red
                    visualI(i,j,1) = 255;
                    visualI(i,j,2) = 0;
                    visualI(i,j,3) = 0;
                elseif gtI(i,j) == 2 %road  blue
                    visualI(i,j,1) = 0;
                    visualI(i,j,2) = 0;
                    visualI(i,j,3) = 255;
                 elseif gtI(i,j) == 3 %vehicle  yellow
                    visualI(i,j,1) = 255;
                    visualI(i,j,2) = 255;
                    visualI(i,j,3) = 0;
                 else
                    visualI(i,j,1) = 128;
                    visualI(i,j,2) = 128;
                    visualI(i,j,3) = 128;
                end
            end
        end
    else % generate mask
        for i = 1:m
            for j = 1:n;
                if gtI(i,j) == 0 %tree  green
                    %visualI(i,j,1) = 0;
                    visualI(i,j,2) = visualI(i,j,2) + 64;
                    %visualI(i,j,3) = 0;
                elseif gtI(i,j) == 1 %building  red
                    visualI(i,j,1) = visualI(i,j,1) + 64;
                    %visualI(i,j,2) = 0;
                    %visualI(i,j,3) = 0;
                elseif gtI(i,j) == 2 %road  blue
                    %visualI(i,j,1) = 0;
                    %visualI(i,j,2) = 0;
                    visualI(i,j,3) = visualI(i,j,3) + 64;
                 elseif gtI(i,j) == 3 %car  yellow
                    visualI(i,j,1) = visualI(i,j,1) + 48;
                    visualI(i,j,2) = visualI(i,j,2) + 48;
                    %visualI(i,j,3) = 0;
                else %other grey
                    visualI(i,j,1) = visualI(i,j,1) + 32;
                    visualI(i,j,2) = visualI(i,j,2) + 32;
                    visualI(i,j,3) = visualI(i,j,3) + 32;
                end
            end
        end
    end
    imwrite(visualI,output_uri);
end