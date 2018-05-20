import os
# dir = '/Users/marcWong/Dataset/PSSD-0426/val30/src'
# srcdir = 'val/src/'
# gtdir = 'val/gt/'
# f = open("val.txt","w")

# dir = '/Users/marcWong/Dataset/PSSD-0426/train131/src'
dir = 'E:\Dataset\PSSD-0519-ft\src'

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
