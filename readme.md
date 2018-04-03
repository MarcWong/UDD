# PKU SFM Semantic Dataset(PSSD)

## 0.Dataset
### 0.1 Dataset Overview
This is a collection of drone image Dataset collected at Peking University using Huludao city image as a supplyment.

*example of PSSD：*
![src image](img/DJI_0285.JPG)
![visualization of gt](img/DJI_0285_visual_gt.png)

**Class Definitions**

|   Class  |Gt Label|Suffix|
|----------|--------|------|
|Vegetation|   0    |_t.png|
| Building |   1    |_b.png|
|   Road   |   2    |_r.png|
|  Water   |   3    |_w.png|
|  Vehicle |   4    |_v.png|
|   Bike   |   5    |_c.png|
|Pedestrian|   6    |_p.png|
|  Other   |  255   | N/A  |

now the 3 classes Dataset is on air(Vegetation+Building+Other). See Download Link below.

### 0.2 Download Link
This Dataset is only for non-commercial use. Please contact **yaowang95@pku.edu.cn** for further information.

### 0.3 Constuction on the way
We are still calling volunteers to build our Dataset. Please contact **yaowang95@pku.edu.cn** to join us!

- Unlabeled Data Download Link Here:

|                         Name                  | amount of images |  src  |Process|
|----------------------------------------------------------|-------------|-------|------|
|[PSSD-1](https://pan.baidu.com/s/1Ak4FTnbDxMQP8UvKZ0h3IQ) |     20      |Huludao| 侯忱 |
|[PSSD-2](https://pan.baidu.com/s/17fDqGTtEZMvRnKHg8wO_SQ) |     20      |Huludao| 侯忱 |
|[PSSD-3](https://pan.baidu.com/s/19ybix4957pQSO8HnQzPr2g) |     20      |Huludao| 侯忱 |
|[PSSD-4](https://pan.baidu.com/s/1dXx1nFfAEKkwwVsMjrQkvA) |     20      |Huludao|宋博宁|
|[PSSD-5](https://pan.baidu.com/s/1EpZqXKEvLOQpbszwj7azmg) |     20      |Huludao| unlabeled |
|[PSSD-6](https://pan.baidu.com/s/1AlH62iZWqzOzuJ5DDeB3pQ) |     13      |Huludao|郭健元|
|[PSSD-7](https://pan.baidu.com/s/1Qa4vOgikZpJ7CNYWb0CUJw) |     20      |  PKU  |易康睿|
|[PSSD-8](https://pan.baidu.com/s/1vPMTfVWqdRdcWMNRQ6Q4Rw) |     20      |  PKU  |文佑尔|
|[PSSD-9](https://pan.baidu.com/s/14pki8WTWziBkwI9_odIsiw) |     20      |  PKU  |文佑尔|
|[PSSD-10](https://pan.baidu.com/s/1fJgruIR_5B5sH2gBlX56mw)|     20      |  PKU  | 金朝 |
|[PSSD-11](https://pan.baidu.com/s/1EuWtiqa8Vkz6BwnKSfgrlg)|     25      |  PKU  | 金朝 |
|[PSSD-12](https://pan.baidu.com/s/1uZxnVgXWbPGdJSzMQu8_kw)|     20      |  PKU  | 王尧 |
|[PSSD-13](https://pan.baidu.com/s/1G5yLRDEkLPlQQGqLHALXeA)|     20      |  PKU  | 王尧 |
|[PSSD-14](https://pan.baidu.com/s/1cWG1kpwaZyrFUqrQEN9Nhw)|     20      |  PKU  | unlabeled |
|[PSSD-15](https://pan.baidu.com/s/1UtAk8O3RHuBDsBUvyHpYYw)|     20      |  PKU  |周昊天|
|[PSSD-16](https://pan.baidu.com/s/1TzK8-8oTzLqnCc-us7dKdg)|     20      |  PKU  | unlabeled |
|[PSSD-17](https://pan.baidu.com/s/1LOSUwLQOEvd_WnGPzYxBdQ)|     20      |  PKU  |顾友鹏|
|[PSSD-18](https://pan.baidu.com/s/1PfADkgzwSWGulCddMkYuyg)|     20      |  PKU  |顾友鹏|
|[PSSD-19](https://pan.baidu.com/s/1fxl1TU79l-IMsywgPeDw2A)|     20      |  PKU  | 姚洋 |

## 1.Labeling Policy (instruction included)
### 1.0 Vegetation(Tree+Grass)
- 1. enter photo shop，press alt+F9 to open Action menu，load action script tree.atn
![selection](img/action.png)
- 2. open the src url, and press CTRL+F2，a raw mask of tree would be generated
![selection](img/selection.png)

- 3. adjust the selected area by hand(lasso is recommended, just press shift/alt and drag the mouse)
- 4. then press CTRL+F3 to generate bitmap, save it by "_t.png" suffix，"DJI_0285_t.png",e.g.

*Annotation example*
![tree](img/DJI_0285_t.png)

**[Chinese version of annotation instruction](tree.pdf)**

### 1.1 Building
- 1. new a black layer, using polygon lasso to select building and fill it with black
- 2. press CTRL+F3 to generate bitmap, save it by "_b.png" suffix，"DJI_0285_t.png",e.g.

*example of annotated result*
![Building](img/DJI_0285_b.png)

### 1.2 Other classess
- 1. After filled ROI with black, press CTRL+F3 to generate bitmap. Remember to save it by suffix(see **Class Definitions** above)


## 2. Directory Naming Policy

**/src**  ```origin source image```

**/gt**  ```ground truth```

**/gt_class** ```groundtruth splited by classes```

**/ori**  ```annotation raw result(annotated '_t.png' / '_b.png' are all here)```

**/visualization** ```visualization result```
```
you can name your directories arbitrarily. Just keep it corresponds to envs in main.m
```


## 3. Scirpts

- ### [main.m](script/main.m)
Processing with raw annotated result. You can DIY your ground truth label here.

- ### [gtVisual.m(function, called by main.m)](script/gtVisual.m)

*parameters*：
```
visual_mode = 0; %1 to run this script
visual_resizerate=0.25; %resize to accelerate
visual_writemode = 0; %1 to save visualization result
```

- ### [gtSplit.m(function, called by main.m)](script/gtSplit.m)

*parameters*：
```
split_mode = 1; %1 to run this script
split_visualmode = 0;  %1 to visualize
```

- ### [visualization.m](script/visualization.m)

After running main.m, you can see the visualization result in**/visualization** by running this script

*parameters*：
```
view_mode = 1; % 0 for automatic, 1 for manual
```

## 4. **Acknowledgements**
Sincerely tribute to all companions contributed to this Dataset: *Xiao Deng(邓枭)*、*Youpeng Gu(顾友鹏)*、*Jianyuan Guo(郭健元)*、*Chen Hou(侯忱)*、*Zhao Jin(金朝)*、*Boning Song(宋博宁)*、*Yao Wang(王尧)*、*You'er Wen(文佑尔)*、*Yang Yao(姚洋)*、*Kangrui Yi(易康睿)*、*Haotian Zhou(周昊天)*。
