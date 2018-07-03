//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//
//// 使用闭包进行排序
//let names = ["Chris","Alex","Ewa","Barry","Daniella"]
//
//
//func backward(_ s1: String, _ s2: String) -> Bool {
//    return s1 > s2
//}
//
//// 将计算子传递到 map 函数中.
//var reversedNums = names.sorted(by: backward)
//
//// 闭包表达式语法
////{
////    (paramters) -> (return type) in
////    statemants
////}
//
//reversedNums = names.sorted(by: {(s1: String, s2: String) -> Bool in
//    return s1 < s2
//})
//
//reversedNums = names.sorted(by: {(s1, s2) -> Bool in
//    return s1 < s2
//})
//
//reversedNums = names.sorted(by: {s1, s2 in return s1 < s2})
//// 当吧闭包作为行内闭包表达式传递给函数时, 形参和返回类型都可以被推断出来, 因此闭包作为函数实参时可以不使用完整格式来实现.
//
//reversedNums = names.sorted(by: {s1, s2 in s1 < s2})
//
//// $0 表示第一个参数 $1 表示第二个参数
//reversedNums = names.sorted(by: { $0 < $1 })
//
//// 因为类型可以推断出来
//reversedNums = names.sorted(by: >)
//
//// 尾随闭包 闭包作为函数的最后一个实际参数传递给函数, 将闭包写在函数形式参数的括号外面
//func someFunctionTakeAClosure(closure: () -> Void) {
//    // func body
//}
//
////someFunctionTakeAClosure(closure: <#T##() -> Void#>)
//someFunctionTakeAClosure {
//
//}
//
//// 以上, 当尾随闭包没有参数, 没有返回值时, 可以省略函数执行使用的末尾(), 使用 括号作为执行对应的 closure 的代码.
//
//reversedNums = names.sorted{$0<$1}
//
//// map 函数中的 闭包的使用
//let digitNames = [
//    0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
//    5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
//]
//
//let numbers = [16,58,510]
//
//let strings = numbers.map {
//    (number) -> String in
//    var number = number
//    var output = ""
//    repeat {
//        output = digitNames[number % 10]! + output
//        number /= 10
//    } while number > 0
//    return output
//}
//// 这里的map 接收的就是一个闭包, 花括号中就是 closure 的定义.
//// 函数之后的闭包的意义: 就是 闭包中的代码会在 函数中的代码执行完了之后, 在未来的某个时刻, 在不同于 函数的地方被执行.
//
//// 闭包捕获值 类似在函数中的小的代码执行块
////返回类型一般可以为 返回一个函数k
//
//
//// 逃逸闭包
//// 因为将在函数调用时, 将闭包添加到定义在函数外部的数组中, 因此需要声明闭包为可逃逸类型.
//var completionHandlers: [() -> Void] = []
//func someFunctionWithEscapingClosure(completionHandler:@escaping () -> Void) {
//    completionHandlers.append(completionHandler)
//}
//
//// 使用 @escaping 修饰的闭包, 在闭包中使用self 中相关的属性时, 需要显示的引用 self.
//
//// 在闭包中没有访问这个函数以外的数据, 且该闭包在函数的最后位置
//func someFunctionWithNonescapingClosure(closure: () -> Void) {
//    closure()
//}
//
//class SomeClass {
//    var x = 10
//    func doSomething() {
//        // 在这个闭包中 修改了外部的变量
//        // 执行这个函数 使用对应的闭包语法, 1 最后的尾随闭包参数简单, 可以简写.
//        someFunctionWithEscapingClosure {
//            self.x = 2001
//        }
//
//
//        someFunctionWithEscapingClosure { self.x = 100 }
//        someFunctionWithNonescapingClosure { x = 200 }
//    }
//}
//
//
//// 自动闭包
//let instance = SomeClass()
//instance.doSomething()
//print(instance.x)
//// Prints "200"
//
//// 执行第一个闭包.
//completionHandlers.first?()
//print(instance.x)
//
//var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//print(customersInLine.count)
//// Prints "5"
//
//// 定义了一个闭包, 不接受参数 执行的操作是 删除
//let customerProvider = {
//    customersInLine.remove(at: 0)
//}
//print(customersInLine.count)
//// Prints "5"
//
//print("Now serving \(customerProvider())!")
//// Prints "Now serving Chris!"
//print(customersInLine.count)
//// Prints "4"
//
//// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
//// 接收一个闭包作为参数.
//func serve(customer customerProvider: () -> String) {
//    print("Now serving \(customerProvider())!")
//}
//
//// 使用一个闭包作为实际参数传递给 serve 函数
//serve(customer: { customersInLine.remove(at: 0) } )
//// Prints "Now serving Alex!"
//
//
//// 标记形式参数使用了自动闭包: 自动闭包: 只要在执行的时候才会真的去计算,
//// customersInLine is ["Ewa", "Barry", "Daniella"]
//func serve(customer customerProvider: @autoclosure () -> String) {
//    print("Now serving \(customerProvider())!")
//}
//serve(customer: customersInLine.remove(at: 0))
//// Prints "Now serving Ewa!"
//
//// 自动逃逸闭包
//// 使用 @autoclosure 和 @escaping 共同修饰
//// customersInLine is ["Barry", "Daniella"]
//// 在函数体外定义一个数组, 如果在函数体内使用 闭包访问修改这个数据, 则说明使用了逃逸闭包, 需要使用过@escaping 修饰.
//var customerProviders: [() -> String] = []
//func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
//    customerProviders.append(customerProvider)
//}
//collectCustomerProviders(customersInLine.remove(at: 0))
//collectCustomerProviders(customersInLine.remove(at: 0))
//
//print("Collected \(customerProviders.count) closures.")
//// Prints "Collected 2 closures."
//for customerProvider in customerProviders {
//    print("Now serving \(customerProvider())!")
//}
//// Prints "Now serving Barry!"
//// Prints "Now serving Daniella!"
//
//
//// 自动闭包练习
//func printIfTrue(predicate: ()-> Bool){
//    if predicate(){
//        print("the result is true is running closure")
//    }
//    else {
//        print("predicate is not true")
//    }
//}
//
////1直接调用方法
//printIfTrue(predicate: { () -> Bool in
//        return 2>3
//})
//
////2闭包在圆括号内
//printIfTrue(predicate: { return 2 > 1 })
////3:使用尾部闭包方式，闭包体在圆括号之外
//printIfTrue(){ return 2 > 1 }
////4:在 Swift 中对闭包的用法可以进行一些简化，在这种情况下我们可以省略掉 return，写成：
//printIfTrue(predicate: { 2 > 1})
////5:还可以更近一步，因为这个闭包是最后一个参数，所以可以使用尾随闭包 (trailing closure) 的方式把大括号拿出来，然后省略括号，变成：
//printIfTrue{2 > 1}
//
//
//// 尾随闭包
//// 这里的括号是函数的表达式
//func someFunctionThatTakesAClosure(closure:() -> Void){
//    //function body goes here
//}
//
////here's how you call this function without using a trailing closure
//
//someFunctionThatTakesAClosure(closure: {
//    //closure's body goes here
//    // 定义闭包的部分
//})
//
////here's how you call this function with a trailing closure instead
//
//// 这里可以在执行闭包的地方写闭包的定义
//someFunctionThatTakesAClosure() {
//    // trailing closure's body goes here
//}

// 闭包捕获
class Pokemon {
    let name: String
    init(name: String) {
        self.name = name
    }
    var debugDescription: String { return "<Pokemon \(name)>" }
    deinit { print("\(self) escaped!") }
}

// 若 closure 可能访问外部的变量, 则需要使用 @escaping 来访问
func delay(seconds: Int, closure: @escaping ()->()) {
    // function body
    let time = DispatchTime.now() + .seconds(seconds)
    
    DispatchQueue.main.asyncAfter(deadline: time) {
        print("time")
        closure()
    }
}

func demo1() {
    let pokemon = Pokemon(name: "Mewtwo")
    print("before closure: \(pokemon.name)")
    
    delay(seconds: 2) {
        // 这个是闭包的定义部分
        print("inside closure: \(pokemon)")
    }
    print("bye")
}

demo1()




























