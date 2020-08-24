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


## 4. **Citation & Acknowledgements**

If you benefit from UDD, please cite our paper as:
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
Sincerely tribute to all companions who contributed to this Dataset: *Xiao Deng(邓枭)*、*Youpeng Gu(顾友鹏)*、*Jianyuan Guo(郭健元)*、*Chen Hou(侯忱)*、*Zhao Jin(金朝)*、*Boning Song(宋博宁)*、*You'er Wen(文佑尔)*、*Yang Yao(姚洋)*、*Kangrui Yi(易康睿)*、*Haotian Zhou(周昊天)*、*Youkun Wu(吴有堃)*、*Xupu Wang(王旭普)*、*Tongwei Zhu(朱彤葳)*、*Zebin Wang(王泽斌)*。
