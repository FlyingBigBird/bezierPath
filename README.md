# bezierPath


折现图的算法实现很简单，简单来说就是需要两个控件：
1. UIScrollView，实现数据多的时候滑动
2. UIBezierPath，绘制图形坐标，绘制点、线.

思路为：
1.通过后台传递的数据，给折现图的X轴一个间距成为X_Margin,根据数据量乘以这个X_Margin,就是scrollView在X轴的contentSize;

2.Y的坐标长度更简单，根据给定的要展示的折线图的高度，将所有数据中最大的数据取出，在这个数据的基础上再等比增加一个数值(展示出来好看，不会在最上方顶头)；
同时，等比将Y轴切成相等的区域，根据数据源的值 通过Y轴的实际长度(在client端的height)和给定长度(数据源最大值加上某个值) 计算出在数据源在Y轴占得高度，
通过bezierPath连接X轴Y轴坐标交汇处成点，添加point，同时绘制曲线，以此类推，一个超长的可滑动折线图就可以画出来了。

完成后或者滑动时可以通过UIViewAnimation的transitionWithView方法进行图像渐变，渐变动画很多，大家可以自己点击看下.
本demo是很简单的入门级的，方便新手学习，复杂的也只是在原有绘制的基础上添加UIAnimation动画或者绘制遮罩图等，大家可以自己摸索下,并不难，欢迎多多沟通.
