# PKU SFM Semantic Dataset(PSSD)

## 0.数据集简介
4000*3000的航拍图像,共计288张，目前共有三个语义类。

|语义类|gt中数值|
|------|------|
|树木  |  0   |
|建筑  |  1   |
|地面  |  2   |

目前数据集还在构建中，之后会考虑加入更多的语义类。

*数据集示例：*

![原图](img/DJI_0285.JPG)
![visual_gt](img/DJI_0285_visual_gt.png)
## 1.命名规则及标注规范
### 1.0 命名规则
**/src**  ```原图```

**/gt**  ```ground truth```

**/ori**  ```标注类别结果```

**/visualization** ```可视化结果```

### 1.1 标注规范
- ### 树
##### 打开photo shop，导入tree.atn，打开原图像后按下CTRL+F2，会自动进行选择，使用shift、alt对边缘细节进行微调后，按下CTRL+F3,生成位图。

*标注结果示例：*
![树](img/DJI_0285_t.png)

**[点此查看ps操作](tree.pdf)**

- ### 建筑
##### 新建空白图层，通过多边形套索，选取建筑后填充为黑色，所有建筑标注完成后生成位图。

*标注结果示例：*
![建筑](img/DJI_0285_b.png)

### 1.2 标注处理脚本

- ### [labelCombine.m](https://github.com/MarcWong/PSSI/blob/master/script/labelCombine.m)
将类别混合为一张gt，可自定义语义标签规则。

- ### [gtVisual.m](https://github.com/MarcWong/PSSI/blob/master/script/gtVisual.m)
write_file_flag：是否要保存visualization的结果
resize_rate：对于原图可视化时间过长，可以resize到1/4的尺寸看效果

## ***致谢***
感谢对数据集构建做出贡献的朋友们（排名不分先后，且不一定全）：邓枭、顾友鹏、侯忱、金朝、宋博宁、王尧、文佑尔、易康睿、周昊天。