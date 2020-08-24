## Labeling Policy (instruction included)
### 1.0 Vegetation
- 1. enter photo shop，press alt+F9 to open Action menu，load action script "ps-annotation.atn"
![selection](../img/action.png)
- 2. open the src url, and press CTRL+F2，a raw mask of vegetation would be generated
![selection](../img/selection.png)

- 3. adjust the selected area by hand(lasso is recommended, just press shift/alt and drag the mouse)
- 4. then press CTRL+F3 to generate bitmap, save it by "_t.png" suffix，"DJI_0285_t.png",e.g.

*Annotation example*
![vegetation](../img/DJI_0285_t.png)

**[Chinese version of annotation instruction](ps-annotation.pdf)**

### 1.1 Building
- 1. new a black layer, using polygon lasso to select building and fill it with black
- 2. press CTRL+F3 to generate bitmap, save it by "_b.png" suffix，"DJI_0285_b.png",e.g.

*example of annotated result*
![Building](../img/DJI_0285_b.png)

### 1.2 Other classes
- 1. After filled ROI with black, press CTRL+F3 to generate bitmap. Remember to save it by suffix(see **Class Definitions** above)


## 2. Directory Naming Policy

**/src**  ```origin source image```

**/gt**  ```ground truth```

**/gt_class** ```groundtruth split by classes```

**/ori**  ```annotation raw result(subfolders containing annotated '_t.png', '_b.png', etc. are all here)```

**/visualization** ```visualization result```
```
you can name your directories arbitrarily. Just keep them corresponding to envs in main.m
```


## 3. Scripts

- ### [script/main.m](../script/main.m)
Processing with raw annotated result. You can DIY your ground truth label here.

*parameters*：
```
visual_mode = 0; % 1 to run gtVisual.m
visual_resizerate=0.25; % downsample rate to accelerate
split_mode = 1; % 1 to run gtSplit.m
split_visualmode = 0;  % 1 to run visualization.m
```

- ### [script/gtVisual.m (function, called by main.m)](../script/gtVisual.m)

To visualize the ground truth map.

- ### [script/gtSplit.m (function, called by main.m)](../script/gtSplit.m)

To generate some split map

- ### [script/visualization.m](../script/visualization.m)

After running main.m, you can see the visualization result in**/visualization** by running this script.

*parameters*：
```
view_mode = 1; % 0 for automatic, 1 for manual
```

- ### [script/tools/writeTxt.py](../script/tools/writeTxt.py)

run this to prepare ```train.txt，val.txt``` for training in [tensorpack](https://github.com/MarcWong/tensorpack).


- ### [script/tools/jpg2png.m](../script/tools/jpg2png.m)

Convert JPG to PNG.
