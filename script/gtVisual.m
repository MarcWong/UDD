% img : a 2-D image of semantic label
% write_file_flag = 1: write file
function out = gtVisual(gt_uri, src_uri, output_uri,mask_or_color, resize_rate, class_number)
    display(['%processing ' gt_uri]);
    %%parameters
    %expansion_times = 0;
    %gt_thres = 128;

    %----------------------------------------%
    gtI = imread(gt_uri);
    visualI = imread(src_uri);
    if length(size(gtI))==3
        gtI = rgb2gray(gtI);
    end
    
    [m n]=size(gtI);
  
    
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
        if class_number == 3 % 3classes
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
                    else
                        visualI(i,j,1) = 128;
                        visualI(i,j,2) = 128;
                        visualI(i,j,3) = 128;
                    end
                end
            end
        else % 5classes
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
                    elseif gtI(i,j) == 2 %water  blue
                        visualI(i,j,1) = 0;
                        visualI(i,j,2) = 0;
                        visualI(i,j,3) = 255;
                     elseif gtI(i,j) == 3 %car  purple
                        visualI(i,j,1) = 64;
                        visualI(i,j,2) = 0;
                        visualI(i,j,3) = 128;
                     else
                        visualI(i,j,1) = 128;
                        visualI(i,j,2) = 128;
                        visualI(i,j,3) = 128;
                    end
                end
            end
        end
    else % generate mask
        if class_number == 3 % 3classes
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
                    else
                        visualI(i,j,1) = visualI(i,j,1) + 32;
                        visualI(i,j,2) = visualI(i,j,2) + 32;
                        visualI(i,j,3) = visualI(i,j,3) + 32;
                    end
                end
            end
        else % 5classes
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
                    elseif gtI(i,j) == 2 %water  blue
                        %visualI(i,j,1) = 0;
                        %visualI(i,j,2) = 0;
                        visualI(i,j,3) = visualI(i,j,3) + 64;
                     elseif gtI(i,j) == 3 %car  purple
                        visualI(i,j,1) = visualI(i,j,3) + 16;
                        %visualI(i,j,2) = 0;
                        visualI(i,j,3) = visualI(i,j,3) + 32;
                     else
                        visualI(i,j,1) = visualI(i,j,1) + 32;
                        visualI(i,j,2) = visualI(i,j,2) + 32;
                        visualI(i,j,3) = visualI(i,j,3) + 32;
                    end
                end
            end
        end
    end
    imwrite(visualI,output_uri);
end