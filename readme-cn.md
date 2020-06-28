# 城市场景无人机数据集(Urban Drone Dataset)

## 0. 城市场景无人机数据集
### 0.1 概览
本数据集由北京大学、河南大学、葫芦岛、沧州等多地点的无人机航拍图像构成。

*样例图片*
![visual_color](img/DJI_0627_visual_color.png)
![visual_mask](img/DJI_0627_visual_mask.png)

**语义类**

### UDD5

|  类别  |Gt 标签|   RGB   | 后缀 |
|-------|-------|----------|------|
|  植被  |   0   |(107,142,35)|_t.png|
|  建筑  |   1   |(102,102,156)|_b.png|
|  道路  |   2   |(128,64,128)|_r.png|
|  车辆  |   3   |(0,0,142)|_v.png|
|  其他  |   4   |(0,0,0)| N/A |

### UDD6 (发布于2020年6月28日)

|  类别  |Gt 标签|   RGB   | 后缀 |
|-------|-------|----------|------|
|  植被  |   0   |(107,142,35)|_t.png|
|  建筑  |   1   |(102,102,156)|_b.png|
|  道路  |   2   |(128,64,128)|_r.png|
|  车辆  |   3   |(0,0,142)|_v.png|
|  房顶  |   4   |(70,70,70) |_roof.png|
|  其他  |   5   |(0,0,0)| N/A |

现在UDD-6数据集已经发布（*植被、建筑、道路、车辆、屋顶、背景*）请查看下方下载链接。

### 0.2 下载链接

本数据集仅供非商业用途使用。

- [UDD-6(train, val) + UDD-5(train, val) + Trained_Model + m1(train+val+test)](https://drive.google.com/drive/folders/1x172jM6iF6SZjMB4jH8FVRgiuGcJDtIe?usp=sharing)

## 引用

如果UDD对您的工作有帮助，请引用我们的文章：

```
@inproceedings{chen2018large,
  title={Large-scale structure from motion with semantic constraints of aerial images},
  author={Chen, Yu and Wang, Yao and Lu, Peng and Chen, Yisong and Wang, Guoping},
  booktitle={Chinese Conference on Pattern Recognition and Computer Vision (PRCV)},
  pages={347--359},
  year={2018},
  organization={Springer}
}
```


## 1.标注规范
### 1.0 植被(树+草地)
- 1. 打开Photo Shop，按下 alt+F9 打开动作菜单，加载动作脚本ps-annotation.atn
![selection](img/action.png)
- 2. 加载一张原始图像,按下CTRL+F2，植被区域将自动被选定(需要微调)
![selection](img/selection.png)

- 3. 对选定区域进行微调(推荐使用套索工具，按下shift拖动鼠标，圈起来的区域将被加进植被区域内，按下alt拖动鼠标，圈起来的区域将被移除)
- 4. 调整结束后，按下CTRL+F3生成二值图, 保存为原文件名+后缀"_t.png"，例如"DJI_0285_t.png".

*标注样例*
![vegetation](img/DJI_0285_t.png)

**[Chinese version of annotation instruction](ps-annotation.pdf)**

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
文件名可任意命名，只需要和main.m中的路径一致即可
```


## 3. 标注处理脚本

- ### [main.m](script/main.m)
处理标注结果，可自定义语义标签规则。


*此函数的参数*：
```
visual_mode = 0; % 1运行gtVisual.m
visual_resizerate=0.25; % 对于原图可视化时间过长，可以resize较小尺寸看效果
split_mode = 1; % 1运行gtSplit.m
split_visualmode = 0;  % 1运行visualization.m
```

- ### [script/gtVisual.m (function，通过main调用)](script/gtVisual.m)

可视化真值图

- ### [script/gtSplit.m (function，通过main调用)](script/gtSplit.m)


- ### [script/visualization.m](script/visualization.m)
执行完main生成visualizati_gt的数据后可运行此脚本看标注效果
此函数的参数：
```
view_mode = 1; % 0 automatic, 1 manual
```

- ### [script/tools/writeTxt.py](script/tools/writeTxt.py)
使用此函数来生成```train.txt，val.txt```供[tensorpack](https://github.com/MarcWong/tensorpack)训练使用

- ### [script/tools/jpg2png.m](script/tools/jpg2png.m)

将.JPG转为.PNG格式.

## 4. ***致谢***
感谢对数据集构建做出贡献的朋友们(排名不分先后): *Xiao Deng(邓枭)*、*Youpeng Gu(顾友鹏)*、*Jianyuan Guo(郭健元)*、*Chen Hou(侯忱)*、*Zhao Jin(金朝)*、*Boning Song(宋博宁)*、*You'er Wen(文佑尔)*、*Yang Yao(姚洋)*、*Kangrui Yi(易康睿)*、*Haotian Zhou(周昊天)*、*Youkun Wu(吴有堃)*、*Xupu Wang(王旭普)*、*Tongwei Wei(朱彤葳)*、*Zebin Wang(王泽斌)*。
