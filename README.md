# 电钢琴班乐谱

## 曲目

1. 玛丽有只小羔羊
2. 欢乐颂
3. “自新大陆”交响曲
4. 铃儿响叮当
5. 小夜曲
6. 粉刷匠
7. 两只老虎
8. 新年好
9. 虫儿飞

## 生成方法

1. 生成 PDF 乐谱

        $ make

2. 生成 JPEG 乐谱

        $ make jpeg

3. 生成 MIDI 文件

        $ make midi

4. 生成 .wav/.aac/.mp3 文件

        $ make wave/aac/mp3

## 所需软件

1. [TeX](http://tug.org/)：排版软件
2. [abcm2ps](http://moinejf.free.fr/)：将 ABC 格式乐谱渲染为 PS 格式文件
3. [ImageMagick](https://imagemagick.org/)：将 PDF 文件转换为 JPEG 格式
4. [abcMIDI](http://abc.sourceforge.net/abcMIDI/)：将 ABC 格式乐谱转换为 MIDI 文件
5. [TiMidity++](http://timidity.sourceforge.net/)：将 MIDI 文件转换为 WAVE 文件
6. [FFmpeg](https://www.ffmpeg.org/)：将 WAVE 文件转换为 MP3/AAC 文件
