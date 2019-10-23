# Matlab-phoneKeyRecognition

一个简单的用于识别双音多频手机按键声的matlab程序，输入一段手机按键声的.wav文件，程序自动将音频分段，用傅里叶变换得出不同按键声的频谱图，与标准频率比较，从而得到手机按键按下的顺序。

项目中的dialWav.wav用于测试，其中手机按键顺序为1234567890。


## Version 1.0

运行fftwave.m函数，在命令行中输出识别得到的按键。

## Version 1.1

增加了图形界面，直接运行phoneKeyRecognition文件夹中的wavAnalyze.m文件，生成图形界面，如下图所示。

![Matlab GUI](https://github.com/ChengsongXiong/Matlab-phoneKeyRecognition/blob/version1.1/wave.PNG)

