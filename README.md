![(logo)](https://avatars2.githubusercontent.com/u/15794032?s=460&v=4)

# LMJPageControl

简体中文 | [English](./README.en.md)

![podversion](https://img.shields.io/cocoapods/v/LMJPageControl.svg?style=flat)
![](https://img.shields.io/cocoapods/p/LMJPageControl.svg?style=flat)
![](https://img.shields.io/badge/language-Swift-orange.svg)
![](https://img.shields.io/cocoapods/l/LMJPageControl.svg?style=flat)

- 一个用swift实现的简单好用的指示器
       
          
## 效果                              
![](https://github.com/JerryLMJ/LMJPageControl/raw/master/demo1.gif)        


## 使用场景
- UIView、Storyboard 等...


## 使用
* 使用cocoapods安装：               
`pod 'LMJPageControl'`
* 手动导入:             
    * 将 `LMJPageControl` 文件拖拽到工程中
    
    
## 属性
| 属性 | 描述 |
| --- | ---
| offsetLeft | 左内边距
| offsetRight | 右内边距
| pointWidth | 圆点大小，默认5
| normalColor | 未选中颜色
| selectedColor | 选中颜色
| normalImg | 未选中图标
| selectedImg | 选中图标
| pageCount | 页数
| currentPage | 当前页数
    

## 更新日志
- **2019.5.31（2.0.2）：**            
修复导入问题。

- **2019.5.31（2.0.0）：**                                          
全新的2.0版本来啦！🎉🎉🎉               
本次更新增加了cocoapods安装，并完善了demo模块的文件结构以及全新的中英文文档。         
优化了控件的属性设置。        

- **2016.1.22（1.0.0）：**                               
给定控件宽高，给出两种初始化控件方法：         
1、通过normal/selected图片点初始化控件           
2、通过normal/selected颜色点初始化控件                                                    
