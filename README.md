### Equatable object

*欢迎访问我的博客：[muhlenXi](http://www.muhlenxi.com)*

> 好记性不如烂笔头之一

对于一个自定义的类（如 People 类），如果要判断两个对象相同，需要 遵循  `Equatable` 协议，并实现  `public static func ==(lhs: People, rhs: People) -> Bool`方法` , 示例代码如下:

```swift
/// 没有父类
class People {
    var name: String
    var ID: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.ID = id
    }
}

extension People: Equatable {
    public static func ==(lhs: People, rhs: People) -> Bool {
        return lhs.ID == rhs.ID && lhs.name == rhs.name
    }
}
```

当我们需要判断两个对象的时候，只需要需要用到  `==` 操作符即可。

注意：当 People 类继承自 NSObject 类时，由于 NSObject 类已经遵循 `Equatable` 协议，我们只需实现协议方法就可以了。许多人在这里就实现如上所示的协议方法了。其实这样是行不通的！（当然你也可以尝试，实践出真知。）**正确的做法是覆写 `override func isEqual(_ object: Any?) -> Bool` 方法。**示例代码如下:

```Swift
/// 父类是 NSObject
class Person: NSObject {
    var name: String
    var ID: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.ID = id
    }
    
    /// 父类 NSObject 已经遵循 Equatable 协议，在这里要实现如下方法：
    override func isEqual(_ object: Any?) -> Bool {
        let person = object as! Person
        return self.name == person.name && self.ID == person.ID
    }
}
```

在上述中的两种情况下，当我们判断一个班级名单中是否有这个人时，就可以用 `contains` 方法来判断了。

[完整的事例代码在这里]()

