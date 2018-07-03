##### 开锁动画
1 动画拆分
步骤分析清楚之后, 再编写动画时则比较容易
2 旋转动画 使用 transForm
3 block 作为函数最后一个参数使用时的省略写法: 直接写, 不用声明
4 函数类型的变量
	(int, int) -> int
	表示接受一个函数变量, 这个变量可以是一个函数, 以两个 int 类型的参数, 一个 int 类型的数据作为返回值使用.
5 闭包在 Swift 中仍然是一个对象, 因此是一个 引用类型.
6 逃逸闭包
	当闭包作为一个实际参数传递给一个函数的时候，我们就说这个闭包逃逸了, 因为他可以在函数返回之后被调用, 使用 @escaping 在形式参数前面 修饰接收 闭包作为参数的函数前面, 表示允许闭包逃逸
	(闭包被存储在定义于函数外的变量里, 可能没有作为一个 union 进行存储)


	''' var completionHandlers: [() -> Void] = []
		func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    		completionHandlers.append(completionHandler)
		}
		'''

