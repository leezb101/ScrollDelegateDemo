# 这是一个通过block实现UIScrollViewDelegate的demo

本demo的设计来源来自于CAAnimationDelegate封装闭包形式的demo，旨在尝试通过闭包封装其它类型的delegate

##### 一点小区别
CAAnimationDelegate在CAAnimation的对象中是被强引用的，所以在设置delegate的过程中不需要有外部引用指向delegate对象，可以直接在animation的delegate的setter方法中用类方法生成。

UIScrollView的delegate是被scrollView本身弱引用的，因此如果直接在delegate的setter方法中调用delegate的类方法生成，在生成操作完毕之后就会被直接释放掉。因此，须要在scrollView所在域中有强引用指向该delegate对象，这也是为什么本demo中的ViewController里有一个scrollDelegate的变量。