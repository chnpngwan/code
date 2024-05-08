package test

object Test2 {

    def main(args: Array[String]): Unit = {

        // TODO Scala ：函数式编程语法
        //      马丁：javac (jdk1.5,jdk1.8)
        //           让代码开发简单一些：少写代码
        //           马丁在编译程序时，可以将省略的代码补全。
        //           开发原则： 能省则省

        // TODO 声明变量
        //      Java语言是一个强类型语言：编译时，应该明确数据类型
        //      Scala语言是一个强类型语言：编译时，应该明确数据类型
        var name = "zhangsan";
        // String name = "zhangsan";
        // TODO 声明函数
        def test(): Unit = {
            println("abc")
        }

//        def sum(): Int = {
//            return 1 + 1;
//        }

        // TODO 1. return关键字可以省略
//        def sum(): Int = {
//            1 + 1;
//        }
        // TODO 2. 如果函数逻辑就一行代码，那么大括号可以省略
//        def sum(): Int = 1 + 1;

        // TODO 3. 函数的返回值可以省略
//        def sum() = 1 + 1

        // TODO 4. 如果函数的参数列表中没有参数，那么小括号可以省略
        //var name = "zhangsan";
        //def sum = 1 + 1

        // 调用函数
        //test()
//        var result = sum;
//        println(result)

        // TODO def关键字和sum函数名也可以省略
        //     IN => OUT
        () => println("123")
    }
}
