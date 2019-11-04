import os

dir = 'E:\\Dataset\\UDD5\\val\\src'
srcdir = 'val/src/'
gtdir = 'val/gt/'

f = open("val.txt","w")
list = os.listdir(dir)
for i in range(0,len(list)):
    path = os.path.join(dir,list[i])
    if os.path.isfile(path):
        str = list[i].replace('.JPG','.png')
        str = str.replace('.jpg','.png')
        f.write(srcdir + list[i] + ' ' + gtdir + str + '\n')
f.close()


dir = 'E:\\Dataset\\UDD5\\train\\src'
srcdir = 'train/src/'
gtdir = 'train/gt/'

f = open("train.txt","w")
list = os.listdir(dir)
for i in range(0,len(list)):
    path = os.path.join(dir,list[i])
    if os.path.isfile(path):
        str = list[i].replace('.JPG','.png')
        str = str.replace('.jpg','.png')
        f.write(srcdir + list[i] + ' ' + gtdir + str + '\n')
f.close()
