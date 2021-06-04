# Urban Drone Dataset(UDD)

## CHANGE LOG

|   date   |  log   |
|----------|--------|
|2018.03.15| Initialization |
|2018.03.23| UDD-3 released |
|2019.11.04| UDD-5 released |
|2020.06.28| UDD-6 released |
|2020.08.24| UDD Benchmark released |

## Benchmark
This benchmark is released to seek for better solutions for UDD dataset, OA refers to Overall Accuracy (or pixelwise accuracy) and mIoU refers to mean Intersection over Union. You are welcomed to contribute new results!

| dataset |  model    | OA   | mIoU | size |
|---------|-----------|------|------|------|
|UDD5     |  GCN      |88.57%|73.17%|302M  |
|UDD5     |  ENet     |88.14%|71.38%|5.5M  |
|UDD6     |  GCN      |86.54%|72.58%|302M  |
|UDD6     |  ENet     |85.20%|69.44%|5.5M  |
|UDD6     |DeepLab V3+|86.90%|73.18%|721M  |

## Dataset Overview
This is a collection of drone image Dataset collected at Peking University, Huludao city, Henan University and Cangzhou city.

*example of UDD：*
<img src="img/sample.png" alt="visual_color" style="zoom:50%;" />


**Class Definition**

- UDD5

|   Class  |Gt Label|   RGB   |
|----------|--------|---------|
|Vegetation|   0    |(107,142,35)|
| Building |   1    |(102,102,156)|
|  Road    |   2    |(128,64,128)|
|  Vehicle |   3    |(0,0,142)|
|  Other   |   4    |(0,0,0) |

- UDD6 (Released on 28 Jun 2020)

|   Class  |Gt Label|   RGB   |
|----------|--------|---------|
|  Other   |   0    |(0,0,0) |
| **Facade** |   1    |(102,102,156)|
|  Road    |   2    |(128,64,128)|
|Vegetation|   3    |(107,142,35)|
|  Vehicle |   4    |(0,0,142)|
| **Roof** |   5    |(70,70,70) |


## Download Links

This Dataset is only for non-commercial use. 

**UDD-5 + UDD-6**: train+val
- [Google Drive](https://drive.google.com/file/d/1BNL8HNFRiNjSzdcQJo-uXiejZJ6DgunY/view?usp=sharing)
- [Baidu Cloud](https://pan.baidu.com/s/1sQavCwH29PUwTEgF3teMBQ) (PW:7qua)

**M1**: only src images, can be used for reconstruction
- [Google Drive](https://drive.google.com/file/d/1CDZR1bNeo4z9EG-8-oHUOMCbacUx5Gty/view?usp=sharing)
- [Baidu Cloud]()


## Scripts
We also proviode a simple toolbox to do basic operations, please refer to `script`.

## Citation & Acknowledgements

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
Sincerely tribute to all companions who contributed to this Dataset: *Yao Wang(王尧)*、*Xiao Deng(邓枭)*、*Youpeng Gu(顾友鹏)*、*Jianyuan Guo(郭健元)*、*Chen Hou(侯忱)*、*Zhao Jin(金朝)*、*Boning Song(宋博宁)*、*You'er Wen(文佑尔)*、*Yang Yao(姚洋)*、*Kangrui Yi(易康睿)*、*Haotian Zhou(周昊天)*、*Youkun Wu(吴有堃)*、*Xupu Wang(王旭普)*、*Tongwei Zhu(朱彤葳)*、*Zebin Wang(王泽斌)*、*Qingtian Zhu(朱擎天)*。
