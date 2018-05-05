//: Playground - noun: a place where people can play

import UIKit

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

let people1 = People(name: "muhlenXi", id: 11)
let people2 = People(name: "muhlenXi", id: 11)
let people3 = People(name: "Bob", id: 12)

let list = [people1, people3]
print(people1 == people2)  // 这里打印的是 true
print(list.contains(people2))  // 这里打印的是 true


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

let person1 = Person(name: "muhlenXi", id: 12)
let person2 = Person(name: "muhlenXi", id: 12)
let person3 = Person(name: "Jane", id: 13)
let list1 = [person1, person3]

print(person1 == person2)  // 这里打印的是 true
print(list1.contains(person3))  // 这里打印的是 true
