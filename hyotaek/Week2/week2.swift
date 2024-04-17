//
//  main.swift
//  SwiftTest
//
//  Created by HyoTaek on 4/10/24.
//

import Foundation

// 1. Any, AnyObject, nil

// * Any
var any: Any = 516
any = "무엇이든지"
any = 516.516

// String타입으로 지정한 anyString에 Any형 변수 any를 할당할 수 없음
let anyString: String = any

// * AnyObject
class HyotaekClass {}

// AnyObject형 anyObj 변수에 HyotaekClass 인스턴스화
var anyObj: AnyObject = HyotaekClass()
// double형을 넣을 수 없음
anyObj = 516.516

// * nil
// 값이 없음을 나타내는 nil 할당 불가
any = nil
anyObj = nil
// ========================================================


// 2. Array, Dictionary, Set

// * Array
// Int형 빈 배열 arr 선언
var arr: Array<Int> = Array<Int>()
// 같은 표현들
// var arr: Array<Int> = [Int]()
// var arr: Array<Int> = []
// var arr: [Int] = Array<Int>()
// var arr: [Int] = [Int]()
// var arr: [Int] = []
// var arr: [Int]()

// append 메소드
arr.append(906)
// arr는 Int형 배열이므로 String 추가 불가
arr.append("Ori")

// 포함 여부 확인
arr.contains(906)

// 삭제
// arr 배열의 0번째 인덱스의 요소 삭제
arr.remove(at: 0)
// arr 배열의 마지막 요소 삭제
arr.removeLast()
// arr 배열의 모든 요소 삭제
arr.removeAll()
// arr 배열의 요소 개수 확인
arr.count

// 인덱스를 벗어나 접근하면 에러 발생

// 수정이 불가능한 상수 배열 immutableArr
let immutableArr = [1, 2, 3]
// 배열에 요소를 추가하거나 삭제 불가능
immutableArr.append(4)
immutableArr.removeAll()


// * Dictionary
// key는 String타입, value는 Any인 빈 dictionary 생성
var diction: Dictionary<String, Any> = [String: Any]()

// 같은 표현
// var diction: Dictionary <String, Any> = Dictionary<String, Any>()
// var diction: Dictionary <String, Any> = [:]
// var diction: [String: Any] = Dictionary<String, Any>()
// var diction: [String: Any]

// key, value 할당
diction["hyotaek"] = "cheonjae"
diction["hyotaek's height"] = 180

// 키에 해당하는 값 변경
diction["hyotaek"] = "very cheonjae"

// 키에 해당하는 값 제거
diction.removeValue(forKey: "hyotaek")

// Array와 마찬가지로 let으로 선언할 경우 변경 불가
let immutableDiction: [String: Any] = [:]
immutableDiction["hyotaek"] = "very handsome"

// 키에 해당하는 값이 없을 수 있음
let someValue: String = initalizedDictionary["name"]

// * Set
var intSet: Set<Int> = Set<Int>()
// Set에 1 삽입
// 아래와 같이 같은 값을 여러번 삽입해도 출력하면 [1]처럼 한번만 등장
intSet.insert(1)
intSet.insert(1)

// Set 삭제
intSet.remove(1)
intSet.removeFirst()

// Set는 집합 연산에 활용됨
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

// 합집합
let union: Set<Int> = setA.union(setB)

// 합집합, 오름차순정렬
let sortedUnion: [Int] = union.sorted()

// 교집합
let intersection: Set<Int> = setA.intersection(setB)

// 차집합
let subtracting: Set<Int> = setA.subtracting(setB)
// ========================================================


// 3. Function

func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> 반환타입 {
    /* 함수 구현부 */
    return 반환값
}

// 반환 값이 없는 함수 (반환 타입은 Void. Void는 생략 가능)
func printName(name: String) -> Void {
    print(name)
}

// 매개 변수 및 반환값이 없는 함수
// 한줄로 표현 가능
func printHello() { print("Hello") }

// 함수 호출
printHello()
printName(name: "Hyotaek")


// 기본 값을 갖는 매개변수는 매개변수 목록의 뒤쪽에 위치하는 것이 좋음
func greeting(friend: String, me: String = "hyotaek") {
    print("Hello \(friend)! I'm \(me)")
}
// 매개변수 기본값을 가지는 매개변수는 호출시 생략 가능
greeting(friend: "daehyeon") // Hello daehyeon! I'm hyotaek
greeting(friend: "duck", me: "dog") // Hello duck! I'm dog

// 함수 내부에서 전달인자를 사용할 때 매개변수 이름을 사용
func greeting(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}

// 함수를 호출할 때 전달인자 label 사용
// friend와 me를 사용하지 않음
greeting(to: "hana", from: "yagom") // Hello hana! I'm yagom

// 매개변수의 전달받는 값의 개수를 파악하기 어려울 때 사용
// friends에는 여러개의 값이 와도 괜찮
func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)!"
}
print(sayHelloToFriends(me: "yagom", friends: "hana", "eric", "wing"))


// 함수에 할당
var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction = greeting(friend:me:)
someFunction("eric", "yagom") // Hello eric! I'm yagom
// ========================================================


// 4. Optional, Optional-Chaining, TypeCasting
// * Optional

// 암시적 추출
var implicitUnwrap: Int! = 100
// 기존 변수처럼 사용 가능
// 하지만 implicitUnwrap에 nil값이 들어있다면 런타임 오류 발생
implicitUnwrap += 1

// optional
var optionalUnwrap: Int? = 100
// nil 할당 가능
optionalUnwrap = nil
// 기존 변수처럼 사용 불가 (opional은 일반 값과 다른 타입이므로 연산 불가)
optionalUnwrap += 1

// Optional 추출
// 1. 강제 추출
var name: String? = "hyotaek"
print(name!)

name = nil
// 강제 추출 시 값이 없으므로 런타인 에러 발생
print(name!)

// 2. Optional Binding
if let Name: String = name {
    print(Name)
}
else {
    print("Name == nil")
}

// 한번에 여러 값 옵셔널 바인딩 가능
if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}

// * 옵셔널 체이닝
class Person {
    var name: String
    var job: String?
    var home: Apartment?
    init(name: String) {
        self.name = name
    }
}
class Apartment {
    var buildNum: String
    var roomNum: String
    var `guard`: Person?
    var owner: Person?
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

// 옵셔널 체이닝 사용
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    } else {
        print("우리집 경비원은 직업이 없어요")
    }
}
guardJobWithOptionalChaining(owner: yagom)

yagom?.home?.guard?.job // nil
yagom?.home = apart
yagom?.home // Optional(Apartment)
yagom?.home?.guard // nil
yagom?.home?.guard = superman
yagom?.home?.guard // Optional(Person)
yagom?.home?.guard?.name // superman
yagom?.home?.guard?.job // nil
yagom?.home?.guard?.job = "경비원"

// 옵셔널 값이 nil일 경우 ??연산자 우측의 값을 반환
var guardJob: String
guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"

// * 타입 캐스팅
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
    }
}
class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다")
    }
}
class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}
// 인스턴스 생성
var yagom: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()

// 참, 거짓을 확인하기 위한 변수 result
var result: Bool
result = yagom is Student // false
result = hana is UniversityStudent // false
result = jason is Person // true

// 업 캐스팅 (부모 클래스로)
var mike: Person = UniversityStudent() as Person
var jenny: Student = Student()
var jina: Any = Person() // as Any 생략가능

// 다운 캐스팅 (자식 클래스로)
// 1. 조건부 다운 캐스팅 (캐스팅에 성공할 경우 옵셔널 타입 반환)
var optionalCasted: Student?
optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil

// 2. 강제 다운 캐스팅 (캐스팅에 성공할 경우 옵셔널이 아닌 일반 타입 반환)
var forcedCasted: Student
forcedCasted = mike as! UniversityStudent
forcedCasted = jenny as! UniversityStudent // 런타임 오류 (jenny는 person이므로 다운 캐스팅 실패)
// ========================================================


// 5. 구조체, 클래스, 열거형
// * 구조체
struct Student {
    // 가변 프로퍼티
    var name: String = "unknown"

    // 키워드도 `로 묶어주면 이름으로 사용 가능
    var `class`: String = "Swift"

    // 타입 메서드
    static func selfIntroduce() {
        print("학생타입입니다")
    }

    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}
// 가변 인스턴스 생성
var yagom: Student = Student()
yagom.name = "yagom"
yagom.class = "스위프트"
yagom.selfIntroduce()   // 저는 스위프트반 yagom입니다

// 불변 인스턴스 생성
let jina: Student = Student()
// 불변 인스턴스이므로 컴파일 에러 발생
jina.name = "jina"
jina.selfIntroduce() // 저는 Swift반 unknown입니다

// * 클래스
class Student {
    // 가변 프로퍼티
    var name: String = "unknown"

    // 키워드도 `로 묶어주면 이름으로 사용할 수 있습니다
    var `class`: String = "Swift"

    // 타입 메서드
    class func selfIntroduce() {
        print("학생타입입니다")
    }

    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항입니다
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}
// 타입 메서드 사용
Student.selfIntroduce() // 학생타입입니다
// 인스턴스 생성
var yagom: Student = Student()
yagom.name = "yagom"
// 인스턴스 생성 (구조체와는 다르게 에러 발생x)
let jina: Student = Student()
jina.name = "jina"

// * 열거형
enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

// 열거형 타입과 케이스를 모두 사용하여도 됩니다
var day: Weekday = Weekday.mon

// 타입이 명확하다면 .케이스 처럼 표현해도 무방합니다
day = .tue

// switch의 비교값에 열거형 타입이 위치할 때
// 모든 열거형 케이스를 포함한다면
// default를 작성할 필요가 없습니다
switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}

enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov

    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("따스한 봄~")
        case .jun, .jul, .aug:
            print("여름 더워요~")
        case .sep, .oct, .nov:
            print("가을은 독서의 계절!")
        case .dec, .jan, .feb:
            print("추운 겨울입니다")
        }
    }
}

Month.mar.printMessage()
// ========================================================


// 6. assert, guard
// * assert
assert(someInt ==  0, "someInt != 0")
// someInt가 0이라면 계속 동작, 0이 아니라면 중지후 에러 메시지

guard let input else { return }
print(input)
// input이 nil이 아니라면 input 출력, nil이라면 return

func someFunction(info: [String: Any]) {
    guard  let name = info["name"] as?  String  else { return }
    print(name)
}
