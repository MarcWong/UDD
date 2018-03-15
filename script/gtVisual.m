% img : a 2-D image of semantic label
% write_file_flag = 1: write file
function out = gtVisual(gt_uri, src_uri, output_uri, write_file_flag, resize_rate)
    display(['%processing ' gt_uri]);
    %%parameters
    expansion_times = 0;
    %gt_thres = 128;

    %----------------------------------------%
    gtI = imread(gt_uri);
    visualI = imread(src_uri);
    if length(size(gtI))==3
            gtI = rgb2gray(gtI);
    end
    gtI = imresize(gtI,resize_rate);
    visualI = imresize(visualI,resize_rate);
    %if max(gtImg(:))==1
    %    gtImg = uint8(gtImg).*255;
    %end
    %if expansion_times>0
    %    gtImg = expand(gtImg,128,expansion_times);
    %end
    [m n]=size(gtI);
    
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
            elseif gtI(i,j) == 2 %ground  blue
                %visualI(i,j,1) = 0;
                %visualI(i,j,2) = 0;
                visualI(i,j,3) = visualI(i,j,3) + 64;
            end
        end
    end
    if write_file_flag
        imwrite(visualI,output_uri);
    end
end