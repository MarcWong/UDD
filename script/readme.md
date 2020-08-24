## Scripts

- ### [main.m](main.m)
Processing with raw annotated result. You can DIY your ground truth label here.

*parameters*：
```
visual_mode = 0; % 1 to run gtVisual.m
visual_resizerate=0.25; % downsample rate to accelerate
split_mode = 1; % 1 to run gtSplit.m
split_visualmode = 0;  % 1 to run visualization.m
```

- ### [gtVisual.m (function, called by main.m)](gtVisual.m)

To visualize the ground truth map.

- ### [gtSplit.m (function, called by main.m)](gtSplit.m)

To generate some split map

- ### [visualization.m](visualization.m)

After running main.m, you can see the visualization result in**/visualization** by running this script.

*parameters*：
```
view_mode = 1; % 0 for automatic, 1 for manual
```

- ### [tools/writeTxt.py](tools/writeTxt.py)

run this to prepare ```train.txt，val.txt``` for training in [tensorpack](https://github.com/MarcWong/tensorpack).


- ### [tools/jpg2png.m](tools/jpg2png.m)

Convert JPG to PNG.
