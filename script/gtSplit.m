% img : a 2-D image of semantic label
% write_file_flag = 1: write file
function out = gtSplit(gt_uri, class_uri,debug_mode)
    display(['%spliting ' gt_uri]);
    %%parameters

    %----------------------------------------%
    gtI = imread(gt_uri);
    if length(size(gtI))==3
            gtI = rgb2gray(gtI);
    end
    
    [m n]=size(gtI);
  
    class_building_uri = [class_uri '_build.png'];
    class_notbuilding_uri = [class_uri '_notbuild.png'];
    class_tree_uri = [class_uri '_tree.png'];
    class_ground_uri = [class_uri '_ground.png'];
    
    %----------------------------------------%
    class_treeI = true(m,n);
    class_buildingI = true(m,n);
    class_groundI = true(m,n);

    for i = 1:m
        for j = 1:n;
            if gtI(i,j) == 0 %tree  green
                class_treeI(i,j) = 0;
            elseif gtI(i,j) == 1 %building  red
                class_buildingI(i,j) = 0;
            elseif gtI(i,j) == 2 %ground  blue
                class_groundI(i,j) = 0;
            end
        end
    end
    class_notuildingI = ~class_buildingI;
    

    if debug_mode == 1 %visualization
        subplot(1,3,1);
        imagesc(class_treeI);
        subplot(1,3,2);
        imagesc(class_buildingI);
        subplot(1,3,3);
        imagesc(class_groundI);
        pause();
    end
    
    %----------------------------------------%
    imwrite(class_buildingI,class_building_uri);
    imwrite(class_notuildingI,class_notbuilding_uri);
    imwrite(class_treeI,class_tree_uri);
    imwrite(class_groundI,class_ground_uri);
end