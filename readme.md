# PKU SFM Semantic Dataset(PSSD)

## 0.数据集简介
北大4000*3000的低空航拍图像,共计288张，目前共有三个语义类。

|语义类|gt中数值|
|------|------|
|树木  |  0   |
|建筑  |  1   |
|地面  |  2   |

目前数据集还在构建中，之后会考虑加入更多的语义类。

*数据集示例：*

![原图](img/DJI_0285.JPG)
![visual_gt](img/DJI_0285_visual_gt.png)
## 1.标注规范
### 1.0  树
- 1、 进入photo shop，按下alt+F9打开动作菜单，载入动作tree.atn
![选取树](img/action.png)
- 2、 打开原图像后按下CTRL+F2，这时会自动选出绿色区域
![选取树](img/selection.png)

- 3、 对框选区域进行微调，选择套索工具，按住shift拖动鼠标是将区域加入选择，按住alt拖动鼠标是将区域去除选择
- 4、 按下CTRL+F3,生成位图，保存为原文件名+"_t.png"，例如"DJI_0285_t.png"

*标注结果示例：*
![树](img/DJI_0285_t.png)

**[点此查看ps操作](tree.pdf)**

### 1.1 建筑
- 1、 新建空白图层，通过多边形套索，选取每个建筑，将其填充为黑色
- 2、 所有建筑标注完成后，点击图像->模式->灰度，再点击图像->模式->位图，选择"50%阈值"，生成位图，保存为原文件名+"_b.png"，例如"DJI_0285_b.png"

*标注结果示例：*
![建筑](img/DJI_0285_b.png)

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

## 4. ***致谢***
感谢对数据集构建做出贡献的朋友们（排名不分先后，且不一定全）：邓枭、顾友鹏、郭健元、侯忱、金朝、宋博宁、王尧、文佑尔、姚洋、易康睿、周昊天。
