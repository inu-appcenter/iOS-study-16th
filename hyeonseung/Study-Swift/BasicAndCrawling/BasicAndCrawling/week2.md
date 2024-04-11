## 데이터 타입 

#### Any, AnyObject, nil

> Any
> 

Swift의 모든 데이터 타입을 지칭하는 키워드 

**var** someAny : **Any** = 100

someAny = "어떤 변수 noproblem"

someAny = 3.15

//let chdouble : Double = someAny

> AnyObject
> 

모든 클래스 타입을 지칭하는 프로토콜 

**class** someClass {}

**var** someAnyObject : AnyObject = someClass()

//someAnyObject = 12.33

> nil
> 

없음(null)을 지칭하는 키워드 

/어떤 데이터 타입이든 상관 없지만, nil은 안됨

//someAny = nil

//someAnyObject = nil

print("Hello World!")


## 함수

기본 형태

> func 함수이름 ( 매개변수1 이름 : 매개변수 1타입, 매개변수2이름 : 매개변수 2타입.. ) → 반환타입 {
           ….
        return 반환값
}
>

```
함수 

// 매개변수 ㅇ, 반환값 ㅇ
func add ( a : Int, b : Int ) -> Int{
     return a + b
}

// 매개변수 ㅇ, 반환값 x
func add ( str : String ) -> Void {
     print (str)
}

// 매개변수 x , 반환값 ㅇ
func add () -> Int {
     return 0 
}

-> func add() { return 0 }

// 매개변수 x , 반환값 x
func add_void () -> Void {
     print("add")
}

-> func add() { print("add")}
```
```
함수의 호출

add ( a: 4, b: 5) //9
add (str: "Hello")  // Hello
add () // 0
add_void () // add
```
```
매개변수 기본값을 갖는 함수

=> 기본값을 갖는 매개변수는 맨 뒤에 위치하는 것이 좋다. 

func 함수명 ( 변수명 : 타입, 변수명 : 타입 = 기본값 .. ) -> 반환타입 {
    함수 구현
    return 반환값 
}

func greeting(friend : String, me : String = "yagom") {
    print("Hello \(friend)! I'm \(me)")
}

greeting(friend : "hana")  // Hello hana! I'm yagom
greeting(friend : "john", me : "eric" ) // Hello john! I'm eric
```

```
전달인자 레이블 

함수를 호출할 때,
매개변수의 역할을 좀 더 명확하게 하거나, 함수 사용자의 입장에서 표현하고자 할 때 사용합니다. 

func greeting (obj friend : String, label me : String ) {
    print("Hello \(friend)! I'm \(me)")
}

// 함수를 호출할 때는 전달인자 레이블로 사용해야 함
// 함수의 매개변수 이름을 바꿔주는 역할을 함
greeting(obj: "hello", label: "yeaana")
// Hello hello! I'm yeaana
```

```
가변 매개변수 

String 으로 된 값 여러개가 들어갈 수 있ㄷ음 !! 
func friends ( me : String , friends : String...)-> String {
    return "hello \(friends)! I'm \(me)"
}

print(friends(me : "hyeon", friends:"hana","yagom","wing"))
// hello ["hana", "yagom", "wing"]! I'm hyeon
print(friends(me : "hyeon"))
// hello []! I'm hyeon
```
```
데이터 타입으로서의 함수 

일급객체(First-class Object)란 
다른 객체들에 일반적으로 적용 가능한 연산을 모두 지원하는 객체를 가리킨다.

// 즉 함수가 변수로서, 매개변수로서, 값으로서 작동한다. 
```
```
함수의 타입 표현

원래 변수 선언 ) var 이름 : 타입 = 값 
var someFunc : (String, String )-> Void = greeting(friend:me:)
print(someFunc)  // (Function) 

someFunc = greeting(obj:label:)
print(someFunc) // (Function ) -> 즉, 함수가 변수값이 됨. 

// 타입이 다르면 함수 할당 x
//someFunc = friends(me : friends:) => friends 가 가변 매개변수임..

func runAnother ( function :(String, String)->Void) {
    function("String", "mike")
}

runAnother (function: greeting(friend:me:))
// Hello String! I'm mike


// (String : String ) -> String 타입으로 만들어본 타입함수
func one_func (to : String, from : String) -> String{
    return "\(to)에게... \(from)으로부터"
}

func runAnother2 ( function : (String, String) -> String){
   print( function("hyeon","James"))
}

runAnother2(function: one_func(to:from:))
// hyeon에게... James으로부터
```

## 옵셔널
옵셔널은 nil의 가능성을 명시적으로 표현. 

- nil가능성을 문서화하지 않아도 코드만으로 충분히 표현 가능
    - 문서/주석 작성시간을 절약
- 전달받은 값이 옵셔널이 아니라면 nil체크를 하지 않더라도 안심하고 사용 가능
    - 효율적인 코딩
    - 예외 상황을 최소화하는 안전한 코딩

옵셔널은 Enum + general  이라고 생각해도 된다. 

```swift
enum Optional<Wrapped> : ExpressibileByNilLiteral {
    case none
    case some(Wrapped)
}

let Optional<Int> = nil  //완전한 문법
let Optional: Int? = nil   // 편의상 이렇게 씀
```

🌟🌟

!  (암시적 추출 옵셔널) 과 ? (옵셔널) 의 차이점 

```swift
var number: Int? = nil 
```

일반적으로 옵셔널 타입을 표현할 때는 ?을 사용한다.  옵셔널을 위에서도 작성했듯이, 값(타입)이 정해져 있을 수도 있고, 없을 수도 (nil) 있다는 가능성을 표현한 데이터 타입이다.  

그래서 옵셔널 타입의 기본형은 nil 이다. 

```swift
var email : String?
print(email)   //nil

email = "everywin@gmail.com" 
print(email)   // Optional("everywin@
```

옵셔널로 정의한 변수는 일반 변수와 다르게, 코드가 실행되기 전까지 값의 유무를 알 수 없다. 또한, 변수를 출력해도 일반 변수와는 다르게 Optional() 이라는 옷을 입고 있다. 

따라서, 옵셔널로 지정한 변수는 옵셔널 타입의 변수이므로 다른 일반 변수와 연산이 불가능하다. 

```swift
let optionalEmail: String? = "hnm@gmail.com"
let requireEmail: String = optionalEmail // 컴파일 에러 
```

### 옵셔널 추출

- 명시적 해제 : 강제해제, 비강제 해제(옵셔널 바인딩)
- 묵시적 해제 : 컴파일러에 의한 자동 해제, 옵셔널의 묵시적 해제

명시적 해제 중 강제적 해제를 먼저 알아보자. 

처음 의문점인 ‘!’ 의 사용이 여기서 나온다. 

```swift
var number : Int? = 3

print(number)   // Optional(3)
print(number!)  // 3 
```

!를 붙여서 강제로 옵셔널 타입을 해제할 수 있다. 그러나 이러한 해제 방식은, 에러가 발생하여 , 프로그램이 종료되어지는 불상사가 있을 수 있어 지양하는 방법이다. 

반면, 비강제 해제 방식으로 안전하게 해제하는 방식이 있다. 이를 옵셔널 바인딩이라고 한다. 

옵셔널 바인딩은 옵셔널의 값이 존재하는지를 검사한 뒤, 존재하면 그 값을 다른 변수에 대입시키는 방법이다. 

```swift
if let num: Int? =5 {
        print(num)
}
```

! 를 사용한 강제 해제보다  안전하게 옵셔널 바인딩을 활용하여 해제하는 것이 더욱 안전한 방법이다. 

다음음 묵시적 해제이다. 

묵시적 해제 또한 !가 들어간다. 

```swift
let string = "12"
var stringToInt : Int! = Int(string)
print(stringToInt + 1) //13
```

옵셔널 변수의 타입을 선언할 때 ? 연산자 대신 ! 연산자를 통해 묵시적 해제를 선언하면, 컴파일러가 자동으로 옵셔널을 해제한다. 

단, nil이 대입될 가능성이 없는 변수일 때만 선언해야 한다. 

다른 예로는, !로 의한 암시적 해제는 비교 연산자를 통해 다른 값과 바교하게 되면 컴파일러가 자동으로 옵셔널을 해제해주기도 한다. 

다음은 그 예이다.
```swift
let value : Int? = 6
if value == 6 {
        print("value가 6입니다")
}else {
        print("value가 6이 아닙니다.")
}

// -> value가 6입니다. 
```

## 옵셔널 체이닝
클래스나 구조체가 옵셔널 타입으로 지정되어 있다면 이를 해제할때 매우 복잡한 코드를 짜야할 수 있다.

다음 예에서 알아보자.

```
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
```
이 형태에서 ChainPerson은 name을 제외하고 옵셔널 타입이고, Apartment는 

buildingNum, roomNum을 제외하고 모두 옵셔널 타입이다. 

이러한 형태에서
```
let yagom: ChainPerson? = ChainPerson(name: "yagom")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: ChainPerson? = ChainPerson(name: "superman")  
```
위와 같이 인스턴스를 생성하고, 

> yagom이 사는 집의 경비원이 있는가?
> 

와 같은 질문에 대한 답을 찾으려 하자. 

순서대로 정리하면 다음과 같다.. 

1) yagom.home? 

2) yagom.home?  → Apartment.guard?

3) yagom.home?  → Apartment.guard? → ChaninPerson.job?
이러한 복잡한 질문을 옵셔널 체이닝을 이용하면 비교적 깔끔한 코드를 짤 수 있다.

```
// 옵셔널 체이닝 사용
// 내가 사는 집의 경비원이 있을까?
func guardJobWithOptionalChaining(owner: ChainPerson?){
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다.")
    }else{
        print("우리집 경비원은 직업이 없어요")
    }
}

```
## 타입캐스팅 
## 구조체, 클래스 

- 구조체
    - 값을 참조한다
        
        즉, 구조체를 복사하여 인스턴스를 생성하기 때문에 인스턴스에서 값을 변경하여도, 원시 구조체의 값은 유지가 된다.
        
        ```
         struct 이름 {      // 이름의 첫글자는 대문자를 이용한다. 
        /* 구현부 */
        - 가변 프로퍼티 (var)
        - 불변 프로퍼티 (let)
        - 타입 프로퍼티 (static)
        - 인스턴스 메서드
        - 타입 메서드 (static)
        }
        ```
        
        `var` : 가변 인스턴스
        → 가변 프로퍼티는 값 수정 O
        → 불변 프로퍼티는 값 수정 X

        `let` : 불변 인스턴스 
        → 가변, 불변  프로퍼티 모두 값 수정 X 

    - 구조체에서 타입 메서드에서 프로퍼티를 사용할 때, 타입 프로퍼티만 사용가능 (static은 메모리에 먼저 상주하기 때문)
        
- 클래스
    - 클래스는 참조 타입이다.  즉, 인스턴스를 하나 생성하면 원시 클래스의 주소를 참조한다.
        인스턴스로 값을 변경하게 되면, 원시 클래스의 값도 수정된다. 
        
    - 단일 상속이 가능하다.
    ```
    class 이름 {      // 이름의 첫글자는 대문자를 이용한다. 
        /* 구현부 */
        - 가변 프로퍼티 (var)
        - 불변 프로퍼티 (let)
        - 타입 프로퍼티 (static)
        - 인스턴스 메서드
        - 타입 메서드 (static)
        - 클래스 메서드 ( class)
    }
    ```
    `var` : 가변 인스턴스
    → 가변 프로퍼티는 값 수정 O
    → 불변 프로퍼티는 값 수정 X
    → 타입 불변 (static let) 프로퍼티도 값 수정 X

    `let` : 불변 인스턴스 
    → 🔆🔆 가변 프로퍼티 수정 가능 
    → 불변 프로퍼티 값 수정 X
    
    ```
    let immuInstance = ClassSample()

    // 불변 인스턴스 -> 가변 프로터피 수정 가능
    immuInstance.mutable = 300

    // 불변 인스턴스 -> 불변 프로퍼티 수정 불가능
    //immuInstance.immutable = 300
    ```
    - 구조체에서 타입 메서드에서 프로퍼티를 사용할 때, 타입 프로퍼티만 사용가능 (static은 메모리에 먼저 상주하기 때문) 
    
## 열거형 

- 열거형의 이름은  `대문자`로 작성

> enum 이름 {
    case 
    case 값1, 값2 
    …
}
>

```
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

```
- 열거형으로 switch문을 작성해야할 때,  모든 열거형을 다 작성해주면 default문을 작성하지 않아도 된다. 그러나, 일부만 적으면 default문 무조건 작성해줘야 한다. 
```
switch day {
case .Mon, .Tue, .Wed, .Thu :
    print("평일,,,,")
case .Fri :
    print("불금 Party")
// Week. 붙여서 작성해도 되지만, day가 열거형 타입이라는걸 컴파일 당시 알아서 굳이 작성하지 않아도 된다.
case Week.Sat, .Sun :      
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
```
- 정수 타입을 가진 Enum타입도 존재 ( 따라서, Hashtable 프로토콜을 따르는 모든 타입이 원시값의 타입으로 지정될 수 있다. ) 

```
enum Num : Int {
    case apple = 0
    case orange = 1
    case pear

}

// pear 은 자동적으로 2가 된다. 
```
- 옵셔널 방식으로 가져오기

```
// 옵셔널 방식으로 가져온 것
var num = Num(rawValue: 0)
print(num)   //Optional(iOS_study.Num.apple)

print(num!)  // 강제 해제

//옵셔널 바인딩
if let num = num {
    print(num)
}
```

- 원시값 가져오기 

```
// 정수 값을 가져올 때
var new_num = Num.apple.rawValue
print(new_num)
```
