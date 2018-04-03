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
|  Pitch   |   3    |_g.png|
|  Water   |   4    |_w.png|
|  Vehicle |   5    |_v.png|
|   Bike   |   6    |_c.png|
|Pedestrian|   7    |_p.png|
|  Other   |  255   | N/A  |

now the 3 classes Dataset is on air(Vegetation+Building+Other). See Download Link below.

### 0.2 Download Link
[m1-288.rar](https://pan.baidu.com/s/1sbDrPlgH5SRNjJgHc4AqTA)
[m1-train200-val40-test48.rar](https://pan.baidu.com/s/15DvvM0AxWiNIHcyTRrhtcA)

### 0.3 Constuction on the way
We are still calling volunteers constructing our Dataset. Please contact **yaowang95@pku.edu.cn** for further information!

- Unlabeled Data Download Here:

|                         Name                             | amount of images |  src  |
|----------------------------------------------------------|------------------|-------|
|[PSSD-1](https://pan.baidu.com/s/1Ak4FTnbDxMQP8UvKZ0h3IQ) |       20         |Huludao|
|[PSSD-2](https://pan.baidu.com/s/17fDqGTtEZMvRnKHg8wO_SQ) |       20         |Huludao|
|[PSSD-3](https://pan.baidu.com/s/19ybix4957pQSO8HnQzPr2g) |       20         |Huludao|
|[PSSD-4](https://pan.baidu.com/s/1dXx1nFfAEKkwwVsMjrQkvA) |       20         |Huludao|
|[PSSD-5](https://pan.baidu.com/s/1EpZqXKEvLOQpbszwj7azmg) |       20         |Huludao|
|[PSSD-6](https://pan.baidu.com/s/1AlH62iZWqzOzuJ5DDeB3pQ) |       13         |Huludao|
|[PSSD-7](https://pan.baidu.com/s/1Qa4vOgikZpJ7CNYWb0CUJw) |       20         |  PKU  |
|[PSSD-8](https://pan.baidu.com/s/1vPMTfVWqdRdcWMNRQ6Q4Rw) |       20         |  PKU  |
|[PSSD-9](https://pan.baidu.com/s/14pki8WTWziBkwI9_odIsiw) |       20         |  PKU  |
|[PSSD-10](https://pan.baidu.com/s/1fJgruIR_5B5sH2gBlX56mw)|       20         |  PKU  |
|[PSSD-11](https://pan.baidu.com/s/1EuWtiqa8Vkz6BwnKSfgrlg)|       25         |  PKU  |
|[PSSD-12](https://pan.baidu.com/s/1uZxnVgXWbPGdJSzMQu8_kw)|       20         |  PKU  |
|[PSSD-13](https://pan.baidu.com/s/1G5yLRDEkLPlQQGqLHALXeA)|       20         |  PKU  |
|[PSSD-14](https://pan.baidu.com/s/1cWG1kpwaZyrFUqrQEN9Nhw)|       20         |  PKU  |
|[PSSD-15](https://pan.baidu.com/s/1UtAk8O3RHuBDsBUvyHpYYw)|       20         |  PKU  |
|[PSSD-16](https://pan.baidu.com/s/1TzK8-8oTzLqnCc-us7dKdg)|       20         |  PKU  |
|[PSSD-17](https://pan.baidu.com/s/1LOSUwLQOEvd_WnGPzYxBdQ)|       20         |  PKU  |
|[PSSD-18](https://pan.baidu.com/s/1PfADkgzwSWGulCddMkYuyg)|       20         |  PKU  |
|[PSSD-19](https://pan.baidu.com/s/1fxl1TU79l-IMsywgPeDw2A)|       20         |  PKU  |

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
处理标注结果，可自定义语义标签规则。

- ### [gtVisual.m(function，通过main调用)](script/gtVisual.m)
此函数的参数：
```
visual_mode = 0; %是否运行此脚本
visual_resizerate=0.25; %对于原图可视化时间过长，可以resize较小尺寸看效果
visual_writemode = 0; %是否要保存visualization的结果
```
- ### [gtSplit.m(function，通过main调用)](script/gtSplit.m)
此函数的参数：
```
split_mode = 1; %是否运行此脚本
split_visualmode = 0;  %是否可视化
```

- ### [visualization.m](script/visualization.m)
执行完main生成visualizati_gt的数据后可运行此脚本看标注效果
此函数的参数：
```
view_mode = 1; % 0 automatic, 1 manual
```

## 4. ***Contribution***
Sincerely tribute to all companions contribute to this Dataset: 邓枭、顾友鹏、郭健元、侯忱、金朝、宋博宁、王尧、文佑尔、姚洋、易康睿、周昊天。
