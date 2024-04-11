
  basic_concept.swift
  BasicAndCrawling

  Created by 한현승 on 4/11/24.


import Foundation

// Optional
// ?
//Int? : Int 값이 들어 있을 수도 있고, 없을 수도 있다 .
let optionalConstant: Int? = nil
//let someConstant: Int = nil // 기본적인 int형은 nil로 초기화할 수 없다.


// nil 할당 가능
// 기존 변수처럼 연산 불가능


// !  (암시적 추출 옵셔널)
// 옵셔널 타입 자체는 열거형 ( swith-> none, some으로 나뉨 )
var optional: Int! = 100


switch optional {
case .none:
    print("this optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// 암시적 추출인 ! 인 경우에는!!
// 기존 변수 처럼 사용 가능

optional = optional + 1
print (optional)
// nil 할당도 가능
optional = nil

// 그러나, nil 할당한 후에 연산을 하면, 잘못된 접근으로 인한 런타임 오류 발생
//optional = optional + 1
// 즉, nil인 상태애서는 연산 x
print(optional)
// 암시적 추출 옵셔널 End



// ? (일반적 옵셔널 )
// int값이 들어 있을 수도 있고, 없을 수도 있고,...
var optionalQues: Int? = 100

switch optionalQues {
case .none:
    print("this optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// 마찬가지로 nil할당할 수 있지만 연산 불가능
print (optionalQues)
// ? 타입이면 연산도 불가능 -=> ?가 int, 옵셔널을 모두 갖기 때문
//optionalQues = optionalQues +1

func printName(_ name : String){
    print(name)
}
var myName: String? = nil
//printName(myName)  myName은 일반타입과 다른 타입으로 취급되서


var newMyName : String? = "hyeon"

if let name: String = newMyName{
    print(newMyName)
}else {
    print("myName == nil")
}

// 강제로 이름 꺼내기
var outname : String? = "hanna"
print(outname!)

var name2 : String? = "mong"

// 옵셔널 바인딩
if let name = outname, let name2 = name2 {
    print("\(name) and \(name2)")
}

name2 = "anna"


//** 구조체

struct Sample {
    var mutable: Int = 100

    let immutable: Int = 100

    static var typeProperty: Int = 100

    func instanceMethod() {
        print("instance method")
    }

    static func typeMethod(){
        print("type method")
    }

}


var mutableInstance: Sample = Sample()

mutableInstance.mutable = 200

print(mutableInstance.mutable)

// 타입은 수정 불가능
//mutableInstance.immutable = 300

mutableInstance.instanceMethod()

// 타입메서드는 인스턴스에서 불가능 (컴파일 에러)
//mutableInstance.typeMethod()

// 인스턴스에서 말고, 직접 값 수정만 가능
Sample.typeProperty = 300

print(Sample.typeProperty)
Sample.typeMethod()



struct Student {
    var name : String = "unknown"
    var `class`: String = "Swift"

    static var grade = 1

    func Introduce() {
        print("저는 \(self.class)반, \(name)입니다. ")
    }

    static func typeIntro() {
        // 타입 메서드에서 프로퍼티는 타입 프로퍼티만 가능하다!!
      //  print("기본 \(grade)학년 \(self.class)반 \(name)학생입니다. ")
        print("기본 \(grade)학년 학생입니다.")
    }
}


Student.typeIntro()

var stu1 = Student()

stu1.name = "yagom"
stu1.class = "Java"
stu1.Introduce()

let stu2 = Student()

// 불변 인스턴스에서는 포로퍼티 값 수정 안됨.
//stu2.name = "lina"
//stu2.class = "스위프트"

stu2.Introduce() // 기본 설정되어있는걸로 컴파일 됨 .


// ** 클래스
class ClassSample {
    var mutable = 100
    let immutable = 100

    static let typeProperty = 100

    static var typemutableProperty = "typePro"

    func instanceMethod() {
        print("인스턴스 메서드")
    }

    static func typeMethod(){
        print("타입메서드 - static")
    }

    class func classMethod(){
        print("타입메서드")
    }
}


var mutableIns = ClassSample()

mutableIns.mutable = 200

// 인스턴스는 불변 프로퍼티 수정 불가능
//mutableIns.immutable = 300
// 출력만 가능
print(mutableIns.immutable)


// 불변 타입 프로퍼티는 수정 불가능
// ClassSample.typeProperty = 300

ClassSample.typemutableProperty = "mutable !!!"

mutableIns.instanceMethod()

ClassSample.typeMethod()

ClassSample.classMethod()

// class func -> 타입 형태이지만, 수정이 가능한 형태

// 타입 메서드라, 인스턴스 접근 안됨
//mutableIns.classMethod()


let immuInstance = ClassSample()


// 불변 인스턴스 -> 가변 프로터피 수정 가능
immuInstance.mutable = 300

// 불변 인스턴스 -> 불변 프로퍼티 수정 불가능
//immuInstance.immutable = 300



// ** 열거형
enum Week {
    case Mon
    case Tue
    case Wed
    case Thu, Fri
    case Sat, Sun
}

// 열거형.type 을 지정해줘야함
var day : Week = Week.Mon

//타입 수정 가능
day = .Sat

print(day)


// 열거형으로 switch문을 작성해야할 때 모든 열거형을 다 작성해주면 default문 작성하지 않아도됨.
// 그러나, 일부만 적으면 default문 작성해줘야 함.

switch day {
case .Mon, .Tue, .Wed, .Thu :
    print("평일,,,,")
case .Fri :
    print("불금 Party")
case Week.Sat, .Sun :       // Week. 붙여서 작성해도 되지만, day가 열거형 타입이라는걸 컴파일 당시 알아서 굳이 작성하지 않아도 된다.
    print("놀러가는 주말 ")
}

day = .Wed

switch day {
case .Mon, .Tue, .Wed, .Thu :
    print("평일,,,,")

case Week.Sat, .Sun :
    print("놀러가는 주말 ")

default :
    print("enum타입의 default 붙으려면...")

}


// 정수값을 갖는 Enum타입
enum Num : Int {
    case apple = 0
    case orange = 1
    case pear

}

// 옵셔널 방식으로 가져온 것
var num = Num(rawValue: 0)
print(num)   //Optional(iOS_study.Num.apple)

print(num!)  // 강제 해제

//옵셔널 바인딩
if let num = num {
    print(num)
}


// 정수 값을 가져올 때
var new_num = Num.apple.rawValue
print(new_num)


// Hashtable 프로토콜을 따르는 모든 타입이 원시값의 타입으로 지정될 수 있다.

// String 타입의 열거형
enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

// 값이 지정되지 않았다면, case의 이름을 원시값으로 사용함
print(School.university.rawValue)

// String 가져오기
var raw = School.elementary.rawValue
print(raw)

// rawvalue로 초기화한 열거형 값은 옵셔널 타입이므로 ? 붙여줘야함.
// 이유 : rawvalue가 case에 해당하지 않을 수 있으므로 !!
var result : School? = School(rawValue: "고등")

if var result1 = result {
    print ("이렇게도..?")
    print(result1)
}


//var student: School? = School(rawValue: "중등")

if let student: School = School(rawValue: "대학"){
    print("rawvalue \(student)")
}else {
    // student 가 없는 변수로...
   // print("\(student)는 없습니다. ")
    print("없는 값 ")
}



enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, july, aug
    case sep, oct, nov

    // 열거형에 메서드도 추가가 가능!!
    func printMonth() {
        // 자신을 뜻함
        switch self {
        case .dec, .jan, .feb :
            print("겨울")
        case .mar, .apr, .may:
            print("봄")
        case .jun, .july, .aug:
            print("여름")
        case .sep, .oct, .nov:
            print("겨울")
        }
    }
}


Month.dec.printMonth()
print(Month.dec.hashValue)


// value type vs reference type
class SomeClass {
    var someProperty = "Property"
}


var someclassInstance = SomeClass()

func someFunc(classIns: SomeClass){
    var localVar = classIns
    localVar.someProperty = "ABC"
}
print(someclassInstance.someProperty)

someFunc(classIns:someclassInstance)

print(someclassInstance.someProperty)


// ** 프로퍼티
// 종류
// 인스턴스 저장, 타입저장, 인스턴스연산, 타입연산, 지연 저장
// 구조체, 클래스 , 열거형(연산프로퍼티만가능)
// 연산프로퍼티는 - var로만 선언! , 전역 , 지역 모두 가능!
// 연산 프로퍼티는 get, set으로 읽기전용, 쓰기전용 두가지로 나뉘고, set만 구현할 수는 없다.
struct Money{
    var currencyRate : Double = 1100
    var dollar : Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {

            dollar = newValue / currencyRate
        }

//        set (newValue) {
//            dollar = newValue / currencyRate
//        }
    }
}

var moneyInMyPocket = Money()

moneyInMyPocket.won = 11000

print(moneyInMyPocket.won)

moneyInMyPocket.dollar = 10

print(moneyInMyPocket.won)



struct Money1 {
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다. ")
        }

        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다.")
        }
    }

    // 프로퍼티 감시자
    var dollar: Double = 0 {
        //willSet의 암시적 매개변수 이름 newValue
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다. ")
        }

        didSet {
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다. ")
        }
    }

    var won: Double {
        get {
            return dollar * currencyRate
        }

        set {
            dollar = newValue / currencyRate
        }

        // 프로퍼티 감시자와 연산프로퍼티 기능을 동시에 사용 불가능

    }
}

var moneyPocket : Money1 = Money1()

moneyPocket.currencyRate = 1150

moneyPocket.dollar = 10

print(moneyPocket.won)


var a: Int = 100 {
    willSet {
        print("\(a)-> \(newValue)")
    }
    didSet {
        print("\(oldValue)-> \(a)")
    }
}

a = 200



//** 클로저

/*
    코드의 블럭 -> 일급시민(first-citizen)
    변수, 상수 등으로 저장, 전달인자로 전달이 가능
    함수 : 이름이 있는 클로서(클로저의 일종)
 */

// 정의
/*
 { (매개변수 목록) -> 반환타입 in
    실행 코드
 }
 */

// 기존 함수사용
func sumFunc(a: Int, b: Int) -> Int {
    return a + b
}

var sum_result = sumFunc(a: 3, b: 3)
print(sum_result)

// 클로저 사용
var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

sum_result = sum(1,2)
print(sum_result)

// sum 변수에도 함수 할당 가능
sum = sumFunc(a:b:)

sum_result = sum(2,2)
print(sum_result)


// 클로저의 사용 : 함수의 전달인자로서의 클로저

//let add: (Int, Int) -> Int
//add = { (a: Int, b: Int) in return a + b }
//let substract: (Int, Int) -> Int
//substract = { (a: Int, b: Int)in return a - b }
//var divide: (Int, Int) -> Int
//divide = { (a: Int, b: Int) in return a / b }

let add: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in return a + b }
let substract: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in return a - b }
var divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) in return a / b }

func calculate (a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var cal = calculate(a: 50, b: 40, method: add)
print(cal)

cal = calculate(a: 50, b: 40, method: substract)
print(cal)

cal = calculate(a: 50, b: 40, method: divide)
print(cal)

// 따로 클로저를 상수.변수에 넣지 않고, 바로 함수 호출할 때 작성하여 전달도 가능
cal = calculate(a: 50, b: 10, method: {(a: Int, b: Int) -> Int in return a * b})
print(cal)

// 후행 클로저
// calculate 함수가 선언되어있다는 전제 하에, 이 함수를 사용할 때
// 540 라인을 다음과 같이 변경할 수 있다.
cal = calculate(a: 50, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}
print("후행클로서 50 + 10 = \(cal)")

// 반환 타입 생략
cal = calculate(a: 50, b: 10, method: { (left: Int, right: Int) in
    return left + right
})
print("반환타입 생략 50 + 10 = \(cal)")

// 반환타입+ 후행클로저
cal = calculate(a: 40, b: 40) { (left: Int, right: Int) in
    return left + right
}
print("후행 + 반환타입 생략 40 + 40 = \(cal)")

// 단축 인자이름
cal = calculate(a: 10, b: 10, method: { return $0 + $1 })
print("단축 인자이름 10 + 10 = \(cal) ")

// 후행클로저
cal = calculate(a: 10, b: 10) { return $0 + $1 }
print("단축 인자이름 + 후행클로저 10 + 10 = \(cal)")

// 암시적 반환 표현
cal = calculate(a: 10, b: 20, method: {$0 + $1})
print("암시적 반환 표현 10 + 20 = \(cal)")

// 후행 클로저
cal = calculate(a: 10, b: 20) { $0 + $1 }
print("암시적 + 후행 10 + 20 = \(cal)")



// ** 옵셔널 체이닝

class ChainPerson {
    var name: String
    var job: String?
    var home: Apartment?
    init(name: String){
        self.name = name
    }
}
class Apartment {
    var buildingNum: String
    var roomNum: String
    var `guard`: ChainPerson?
    var owner: ChainPerson?
    init(dong: String, ho: String){
        buildingNum = dong
        roomNum = ho
    }
}

let yagom: ChainPerson? = ChainPerson(name: "yagom")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: ChainPerson? = ChainPerson(name: "superman")

// 옵셔널 체이닝 사용
// 내가 사는 집의 경비원이 있을까?
func guardJobWithOptionalChaining(owner: ChainPerson?){
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다.")
    }else{
        print("우리집 경비원은 직업이 없어요")
    }
}


guardJobWithOptionalChaining(owner: yagom)










//print(yagom?.home?.guard?.job)
//
//yagom?.home = apart
//print(yagom?.home)
//
//print(yagom?.home?.guard)
//yagom?.home?.guard = superman
//print(yagom?.home?.guard)
//
//print(yagom?.home?.guard?.job)
//yagom?.home?.guard?.job = "경비원"
//print(yagom?.home?.guard?.job)


// nil 병합 연산자
//var guardJob: String
//guardJob = yagom?.home?.guard?.job ?? "슈펴맨"
//print(guardJob)
//yagom?.home?.guard?.job = nil
//guardJob = yagom?.home?.guard?.job ?? "슈펴맨"
//print(guardJob)



//** 타입 캐스팅



// ** assert
// 디버깅 모드에서만 동작
// 주로, 조건의 검증을 위하여 사용
var someInt: Int = 0
assert(someInt == 0, "someInt != 0 : 조건을 만족하지 못했을 때 나오는 메세지")
someInt = 1
//assert(someInt == 0) // 동작 중지, 검증 실패
//assert(someInt == 0, "someInt !=0 !! ")
// Thread1 : Assertion failed: someInt !=0 !! <= 메세지 나오고 프로그램 중지됨.

func functionWithAssert(age: Int?){
    assert(age != nil, "age==nil") // nil이 아니면 넘어감
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다")

    print("당신의 나이는 \(age!)세 입니다.")
}

functionWithAssert(age: 30)
//functionWithAssert(age: -1)
//functionWithAssert(age: nil)

// assert는 프로그램이 중지 가 될 뿐, 종료되지 않는다.
// 빠른 종료를 원할 땐, guard사용

//**  guard
// 특정 실행 구문을 종료하기 위해선, break, return이 반드시 존재해야 한다.

func functionWithGuard(age: Int?){
    // 만족하면 변수 선언 계속 이어짐
    guard let unwrappedAge = age,
          unwrappedAge < 130,
          unwrappedAge >= 0 else {
        print("나이값 입력이 잘못되었습니다.")
        return
    }
    print("당신의 나이는 \(unwrappedAge)세 입니다. ")
}

functionWithGuard(age: 30)


var count = 1
while true {
    guard count < 3 else {break}

    print (count)
    count += 1
}

func someFunction ( info: [String: Any]){
    guard let name = info["name"] as? String else{
        return  //함수일때 리턴, 반복문이나 스위치같은때에 break
    }

    guard let age = info["age"] as? Int, age >= 0 else {return}

    print("\(name) : \(age)")
}

someFunction(info: ["name": "jenny", "age": 12])
// 더이상 실행되지 않고 종료
someFunction(info: ["name": "mike"])
someFunction(info: ["name": "alle", "age": "22"])

enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

class VendingMachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0

    func receiveMoney(_ money: Int) throws {
        // 입력한 돈 0원 이하 -> 오류
        guard money > 0 else{
            throw VendingMachineError.invalidInput
        }

        self.deposited += money
        print("\(money)원 받음 ")

    }

    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }

        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }

        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }

        let totalPrice = numberOfItemsToVend * itemCount
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        return "[수행완료] \(numberOfItemsToVend)개 제공"

    }
}

let machine: VendingMachine = VendingMachine()

var vend_result: String?

//do {
//   try machine.receiveMoney(500)
//   vend_result = try machine.vend(numberOfItems: 3)
//   print(vend_result!)
//}catch {
//    switch error {
//    case VendingMachineError.invalidInput :
//        print("입력이 잘못되었습니다.")
//    case VendingMachineError.insufficientFunds(let moneyNeeded) :
//        print("\(moneyNeeded)원이 부족합니다.")
//    case VendingMachineError.outOfStock :
//        print("재고가 부족합니다.")
//    default :
//        print("알 수 없는 오류 \(error)")
//    }
//}

try? machine.receiveMoney(500)
vend_result = try? machine.vend(numberOfItems: 3)
print(vend_result)

if let vend_result = vend_result {
    print (vend_result)
}

