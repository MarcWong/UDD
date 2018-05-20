# 北大三维重建数据集(PKU SFM Semantic Dataset)

## 0. 北大三维重建数据集
### 0.1 概览
本数据集由北大、葫芦岛无人机航拍图像构成，共计686张图像，目前已完成288+60张。

*样例图片*
![src image](img/DJI_0285.JPG)
![visualization of gt](img/DJI_0285_visual_gt.png)

**语义类**
|  类别  |Gt 标签|   RGB   | 后缀 |
|-------|-------|----------|------|
|  植被  |   0   |(0,255,0)|_t.png|
|  建筑  |   1   |(255,0,0)|_b.png|
|  水面  |   2   |(0,0,255)|_w.png|
|  车辆  |   3   |(64,0,128)|_v.png|
|  其他  |  255  |(128,128,128)| N/A |

<div style="display: flex;">
    <div>
    植被
    <div style="width:40px;height:20px;background-color:rgb(0,255,0);"></div>
    </div>
    <div>
    建筑
    <div style="width:40px;height:20px;background-color:rgb(255,0,0);"></div>
    </div>
    <div>
    水面
    <div style="width:40px;height:20px;background-color:rgb(0,0,255);"></div>
    </div>
    <div>
    车辆
    <div style="width:40px;height:20px;background-color:rgb(64,0,128);"></div>
    </div>
    <div>
    其他
    <div style="width:40px;height:20px;background-color:rgb(128,128,128);"></div>
    </div>
</div>

### 0.2 下载链接
本数据集仅供非商业用途，如有需要获取，请联系**yaowang95@pku.edu.cn**

### 0.3 数据集构建
欢迎志愿者们加入构建数据集的工作中，详情请联系**yaowang95@pku.edu.cn**

- 原始数据下载链接:

|                         Name                  | amount of images |  src  |Collaborator|
|----------------------------------------------------------|-------------|-------|------|
|[PSSD-1](https://pan.baidu.com/s/1Ak4FTnbDxMQP8UvKZ0h3IQ) |     20      |Huludao| 侯忱，已完成 |
|[PSSD-2](https://pan.baidu.com/s/17fDqGTtEZMvRnKHg8wO_SQ) |     20      |Huludao| 侯忱 |
|[PSSD-3](https://pan.baidu.com/s/19ybix4957pQSO8HnQzPr2g) |     20      |Huludao| 顾友鹏 |
|[PSSD-4](https://pan.baidu.com/s/1dXx1nFfAEKkwwVsMjrQkvA) |     20      |Huludao|宋博宁，已完成|
|[PSSD-5](https://pan.baidu.com/s/1EpZqXKEvLOQpbszwj7azmg) |     20      |Huludao| 宋博宁 |
|[PSSD-6](https://pan.baidu.com/s/1AlH62iZWqzOzuJ5DDeB3pQ) |     13      |Huludao|王尧|
|[PSSD-7](https://pan.baidu.com/s/1Qa4vOgikZpJ7CNYWb0CUJw) |     20      |  PKU  ||
|[PSSD-8](https://pan.baidu.com/s/1vPMTfVWqdRdcWMNRQ6Q4Rw) |     20      |  PKU  |文佑尔|
|[PSSD-9](https://pan.baidu.com/s/14pki8WTWziBkwI9_odIsiw) |     20      |  PKU  | ___ |
|[PSSD-10](https://pan.baidu.com/s/1fJgruIR_5B5sH2gBlX56mw)|     20      |  PKU goPro  | 金朝，已完成 |
|[PSSD-11](https://pan.baidu.com/s/1EuWtiqa8Vkz6BwnKSfgrlg)|     25      |  PKU  | ___ |
|[PSSD-12](https://pan.baidu.com/s/1uZxnVgXWbPGdJSzMQu8_kw)|     20      |  PKU  | ___ |
|[PSSD-13](https://pan.baidu.com/s/1G5yLRDEkLPlQQGqLHALXeA)|     20      |  PKU  | ___ |
|[PSSD-14](https://pan.baidu.com/s/1cWG1kpwaZyrFUqrQEN9Nhw)|     20      |  PKU  | ___ |
|[PSSD-15](https://pan.baidu.com/s/1UtAk8O3RHuBDsBUvyHpYYw)|     20      |  PKU  | ___ |
|[PSSD-16](https://pan.baidu.com/s/1TzK8-8oTzLqnCc-us7dKdg)|     20      |  PKU  | ___ |
|[PSSD-17](https://pan.baidu.com/s/1LOSUwLQOEvd_WnGPzYxBdQ)|     20      |  PKU  |顾友鹏，已完成|
|[PSSD-18](https://pan.baidu.com/s/1PfADkgzwSWGulCddMkYuyg)|     20      |  PKU  | ___ |
|[PSSD-19](https://pan.baidu.com/s/1fxl1TU79l-IMsywgPeDw2A)|     20      |  PKU  | ___ |
|[PSSD-20]()|     25      |  PKU  | 王旭普、王尧、吴有堃，已完成 |

## 1.标注规范
### 1.0 植被(树+草地)
- 1. 打开Photo Shop，按下 alt+F9 打开动作菜单，加载动作脚本tree.atn
![selection](img/action.png)
- 2. 加载一张原始图像,按下CTRL+F2，植被区域将自动被选定(需要微调)
![selection](img/selection.png)

- 3. 对选定区域进行微调(推荐使用套索工具，按下shift拖动鼠标，圈起来的区域将被加进植被区域内，按下alt拖动鼠标，圈起来的区域将被移除)
- 4. 调整结束后，按下CTRL+F3生成二值图, 保存为原文件名+后缀"_t.png"，例如"DJI_0285_t.png".

*标注样例*
![tree](img/DJI_0285_t.png)

**[Chinese version of annotation instruction](tree.pdf)**

### 1.1 Building
- 1、 新建空白图层，通过多边形套索，选取每个建筑，将其填充为黑色
- 2、 所有建筑标注完成后，按下CTRL+F3，生成位图 (如果CTRL+F3无反应，则点击图像->模式->灰度，再点击图像->模式->位图，选择"50%阈值")，保存为原文件名+后缀"_b.png"，例如"DJI_0285_b.png"

*标注样例*
![Building](img/DJI_0285_b.png)

### 1.2 其他类别
- 1、 新建空白图层，通过多边形套索，选取相应区域，将其填充为黑色
- 2、 所有区域标注完成后，按下CTRL+F3，生成位图 (如果CTRL+F3无反应，则点击图像->模式->灰度，再点击图像->模式->位图，选择"50%阈值")，保存为原文件名+"相应后缀"，例如"DJI_0285_v.png"(参见[Class Definitions]())


## 2. 命名规则

**/src**  ```原图```

**/gt**  ```ground truth```

**/gt_class** ```groundtruth分类别结果```

**/ori**  ```标注类别结果(经过标注的"_t.png"，"_b.png"都放置在此目录下)```

**/visualization** ```可视化结果```

```
文件名可任意命名，只需要和main.m中的env路径一致即可
```


## 3. 标注处理脚本

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

- ### [writeTxt.py](script/tools/writeTxt.py)
使用此函数来生成train.txt，val.txt供训练使用

## 4. ***致谢***
感谢对数据集构建做出贡献的朋友们(排名不分先后): 邓枭、顾友鹏、郭健元、侯忱、金朝、宋博宁、王尧、文佑尔、姚洋、易康睿、周昊天、王旭普、吴有堃。
