# 기초개념

## 이름짓기 규칙

- lower camel case - 함수, method, 변수, 상수
    - EX) whatName
- upper camel case - 타입(클래스, 구조체, 열거형, extension)
    - ex) Person, Point, Week

→ 변수명이랑 메소드명이랑 같아도 되나?

## 콘솔로그 남기기

1. print 함수 : 단순 문자열 출력
2. dump 함수 : 디테일한 설명까지 출력

## 문자열 보간법

1. Stringg Interpolation : 프로그램 실행 중 문자열 내에 변수 또는 상수의 실질적인 값을 표현하기 위해 사용

## 상수와 변수

- 상수 선언 키워드 : let
- 변수 선언 키워드 : var

> 상수 선언  let 이름 : type = value
> 

> 변수 선언  var 이름 : type = value
> 

    → 값의 타입 명확하면 type 생략 가능

> 상수 선언  let 이름=  value
> 

> 변수 선언  var 이름= value
> 

* swft는 띄어쓰기에 민감함 !!! 유의하기!!!!!!!

# data type

- 기본 데이터 타입
    1. Bool (T/F)
        
        → 0/1로 구분할 수 없음(typeerror : Int로 인식)
        
    2. Int
    3. UInt
        1. unsigned integer: 부호가 없는(양의 정수)type)
        2. 음수 넣으면 안돌아감!(부호에 까다로움)
    4. Float
        1. 정수 가능
        2. 변수 대입 불가(실수/정수가 저장된 변수도)
            
            someUInt = someInt
            
    5. Charater
        1. 유니코드 사용
        2. 이모지 사용가능
        3. 큰따옴표(“”) 사용.
        
        ```swift
        var someCharacter: Character = "😀"
        someCharacter = "👭"
        someCharacter = "가"
        someCharacter = "A"
        // someCharacter = "하하하" // 컴파일 오류발생
        print(someCharacter)
        ```
        
    6. String
        1. 큰따옴표(“”) 사용.
        
        ```swift
        var someString: String = "하하하 ? "
        someString = someString + "웃으면 복이와요"
        print(someString)
        
        // someString = someCharacter // 컴파일 오류발생
        ```
        
        b. 여러줄 문자열은 큰따옴표 세 개 사용.
        
        ```swift
        someString = """
        여러줄 문자열 사용가능
        첫 줄에 겹따옴표 세 개,
        마지막 줄에 겹따옴표 세 개 사용하기
        """
        
        someString = """
        겹따옴표를 작성한 줄(첫줄, 끝줄)에서
        줄 바꿈을 하지 않으면 오류가 발생
        """
        /*
        someString = """오류발생
        오류발생"""
        */
        ```
        
- Any, AnyObject, nil
    1. Any
        1. Swift의 모든 타입을 지칭하는 키워드(모든 타입 수용 가능)
        2. data type 위치에 들어올 수 있음
        
        ```swift
        var someAny: Any = 100
        someAny = "어떤 타입도 수용 가능합니다"
        someAny = 123.12
        //let someDouble: Double = someAny
        ```
        
        → Any타입을 Double타입에 할당할 수 없다는 오류가 뜸.
        
        → 명시적으로 타입변환 필요!(추후에 다룬대~)
        
    2. Anyobject
        1. 모든 클래스 타입을 지칭하는 프로토콜
        
        ```swift
        class SomeClass {}
        
        var someAnyObject: AnyObject = SomeClass()
        
        // someAnyObject = 123.12 //class 인스턴스 이외에는 오류 발생
        ```
        
    3. nill : 없음(== NULL, Null, null)
        
        ```swift
        someAny = nil         // 컴파일 오류발생
        someAnyObject = nil   // 컴파일 오류발생
        ```
        
        → someAny : Any 타입, someAnyObject: Anyobject 타입이므로 nil을 할당할 수 없음
        
        → 그럼 언제다루지?
        
    - Collection type
        1. Array
            
            : 순서가 있는 list형태의 컬렉션 타입
            
            1. 빈 Array 생성
            
            ```swift
            var integers: Array<Int> = Array<Int>() // []
            var doubles: Array<Double> = [Double]() // Array<Double> 축약 => [Double]
            var strings: [String] = [String]()
            var characters: [Character] = [] // []는 새로운 빈 Array
            ```
            
            1. name.***append***(x) → 추가
            
            ```swift
            integers.append(1) // [1]
            integers.append(100) // [1, 100]
            //integers.append(101.1) // 타입 일관성 유지 필수
            ```
            
            3. name.contains(x) →  bool형식으로 출력
            
            ```swift
            
            print(integers.contains(100)) // true
            print(integers.contains(99)) // false
            ```
            
            1. remove 함수
            
            ```swift
            integers.remove(at: 0) // 0번째 index값 삭제 -> 1
            integers.removeLast() // 마지막 요소 삭제 -> 100
            integers.removeAll() // 모든 요소 삭제 -> []
            
            // 5. count : 몇개가 들어있는 지
            
            ```
            
            1. name.***count***: 리스트에 숫자가 몇 개가 들어있는지
            
            ```swift
            print(integers.count)   // 0
            ```
            
            6. 비어있는 배열 상태에서 0번째 인덱스 접근 -> 오류
            
            ```swift
            //integers[0] // 범위 초과 - 런타임 오류 발생
            ```
            
            7. let을 사용하여 Array를 선언하면 불변 Array
            
            ```swift
            let immutableArray = [1, 2, 3]
            
            // 7-1. let Array의 요소 : 추가/삭제 X -> 컴파일 오류 발생
            //immutableArray.append(4)
            //immutableArray.removeAll()
            ```
            
        2. Dictionary
            
            : key와 value가 쌍으로 이루어진 컬렉션
            
            1. Dictionary<key 타입, value 타입>
            ⇒ [ key타입 : value타입 ]()
            
            ```swift
            var anyDictionary: Dictionary<String, Any> = [String: Any]() //[:]
            anyDictionary["someKey"] = "value" 
            anyDictionary["anotherKey"] = 100
            print(anyDictionary) // ["someKey": "value", "anotherKey": 100]
            ```
            
            1. Key에 해당하는 값 변경 : 변수[key값]= 변경할 value값
            
            ```swift
            anyDictionary["someKey"] = "dictionary"
            print(anyDictionary) // ["someKey": "dictionary", "anotherKey": 100]
            ```
            
            1. Key에 해당하는 값 제거
            
            ```swift
            anyDictionary.***removeValue***(forKey: "anotherKey") //key에 해당하는 value 없앨 때
            anyDictionary["someKey"] = nil //위와 유사한 표현
            print(anyDictionary) // [:]
            ```
            
            1. 빈 Dictionary 생성
            
            ```swift
            let emptyDictionary: [String: String] = [:]
            let initalizedDictionary: [String: String] = ["name": "yagom", "gender": "male"] //초기 값을 가지는 Dictionary 생성
            
            // 4-1. let으로 선언한 불변 Dictionary는 수정 불가 - 컴파일 오류 발생
            
            //emptyDictionary["key"] = "value" 
            
            // name 키에 해당하는 값이 Dictionary에 존재하지 않을 수 있으므로 컴파일 오류 발생 
            //let someValue: String = initalizedDictionary["name"]
            ```
            
        - set
            
            : 순서가 없고, 멤버가 유일한 것을 보장하는 컬렉션 타입
            → 중복된 값이 없다는 것을 보장해줌!
            
            1. 빈 Int Set 생성
            
            ```swift
            var integerSet: Set<Int> = Set<Int>()
            ```
            
            1. insert : 요소 추가
            
            ```swift
            integerSet.insert(1)
            integerSet.insert(100)
            integerSet.insert(99)
            integerSet.insert(99)
            integerSet.insert(99) // 같은 값을 많이 넣어줘도 99는 한번만 들어감
            print(integerSet) // [100, 99, 1]
            ```
            
            1. constains : 안에 요소가 있는지 체크
            
            ```swift
            print(integerSet.contains(1)) // true
            print(integerSet.contains(2)) // false
            ```
            
            1. remove : 삭제
            
            ```swift
            integerSet.remove(100)
            integerSet.removeFirst()
            ```
            
            1. count : 세트 안에 몇 개의 요소가 있는지 체크
            
            ```swift
            print(integerSet.count) // 1
            ```
            
            1. Set :  집합 연산에 꽤 유용합니다
            
            ```swift
            let setA: Set<Int> = [1, 2, 3, 4, 5] //{1,2,3,4,5}
            let setB: Set<Int> = [3, 4, 5, 6, 7] //{3,4,5,6,7}
            
            //1. 합집합
            let union: Set<Int> = setA.union(setB)
            print(union) // {2, 4, 5, 6, 7, 3, 1}
            //1-1. 합집합 오름차순 정렬
            let sortedUnion: [Int] = union.sorted()
            print(sortedUnion) // [1, 2, 3, 4, 5, 6, 7]
            
            //2. 교집합
            let intersection: Set<Int> = setA.intersection(setB)
            print(intersection) // [5, 3, 4]
            
            //3. 차집합
            let subtracting: Set<Int> = setA.subtracting(setB)
            print(subtracting) // [2, 1]
            ```
            
        
        # Optional
        
        : 값이 있을수도, 없을수도 있음
        
        optional이 아닌 값에 nil을 할당하려고 하면 오류발생
        
        - 옵셔널이 필요한 이유 ; nil의 가능성을 명시적으로 표현 → nil 체크 없이 사용 가능(효율 및 안전)
        - 사용법 : 자료형 뒤에 ? 붙여서 사용
        
        →  실제 형태 : enum+general
        
        ```swift
        enum Optional<Wrapped> : ExpressibleByNilLiteral {
        	case none //값이 없다
        	case some(Wrapped) //값이 있다
        } //원랜 값의 존재 여부인 두가지를 가지고 있음
        
        let optionalValue: Optional<Int> = nil
        let optionalValue: Int? = nil
        ```
        
        ### 암시적 추출 옵셔널
        
        → type 뒤에 느낌표 붙여서 사용
        
        1. 기존 변수처럼 사용 가능
        2. nil 할당 가능
        3. 잘못된 접근으로 인해 런타임 발생가능
        4. 옵셔널
            1. nil할당 가능
            2. 기존 변수처럼 사용 불가 - 옵셔널과 일반값은 다른 타입 !!
        
        ## 옵셔널 값 추출
        
        ### 옵셔널 바인딩
        
        : nil 체크+안전한 값 추출
        
        → if-let 구문 사용. cf) 두개의 값을 한번에 바인딩 가능(쉽표사용)
        
        *string ≠ string? 타입 다르게 취급
        
        ### 옵셔널 강제추출
        
        → 강제 추출함(값이 없을 때 출력 → 런타임 오류 발생)
        
        → 느낌표사용
        
        Q. myName! 이랑 myName이랑 같은 변수로 취급하나? 옵셔널은 다른 변수로 취급한다고 했는데 느낌표 붙일때는 또 다른가?
        
        ## 옵셔널 체이닝
        
        : 옵셔널 요소 내부의 프로퍼티. 또다시 옵셔널이 연속으로 사용되는 경우 유용
        
        ```swift
        let yagom: Person? = Person(name: "yagom")
        let apart: Apartment? = Apartment(dong: "101", ho: "202")
        let superman: Person? = Person(name: "superman")
        ```
        
        → 옵셔널 체이닝 실행 → 결과값이 nil 일수도 있음 ⇒ 결과 type도 optional
        
        ```swift
        // 옵셔널 체이닝을 사용한다면
        func guardJobWithOptionalChaining(owner: Person?) {
            if let guardJob = owner?.home?.guard?.job {
                print("우리집 경비원의 직업은 \(guardJob)입니다")
            } else {
                print("우리집 경비원은 직업이 없어요")
            }
        }
        ```
        
        if) optional 체이닝 사용 안하면 if의 연속.,,
        
        ```swift
        // 옵셔널 체이닝을 사용하지 않는다면...
        func guardJob(owner: Person?) {
            if let owner = owner {
                if let home = owner.home {
                    if let `guard` = home.guard {
                        if let guardJob = `guard`.job {
                            print("우리집 경비원의 직업은 \(guardJob)입니다")
                        } else {
                            print("우리집 경비원은 직업이 없어요")
                        }
                    }
                }
            }
        }
        guardJob(owner: yagom)
        ```
        
        → 연속적으로 사용 가능(순차적으로 실행, 중간에 하나라도 nil값이면 다음 옵셔널로 넘어가지 않음) ⇒ 연쇄작용(마지막 변수는 일반변수로 사용)
        
        ```swift
        yagom?.home?.guard?.job // nil
        yagom?.home = apart
        yagom?.home // Optional(Apartment)
        yagom?.home?.guard // nil
        yagom?.home?.guard = superman
        yagom?.home?.guard // Optional(Person)
        yagom?.home?.guard?.name // superman
        yagom?.home?.guard?.job // nil
        yagom?.home?.guard?.job = "경비원"
        ```
        
        ### nil 병합 연산자
        `Optional ?? Value`
        
        → 옵셔널 값이 nil 일 때 뭔가를 대입을 하고싶을 경우 사용
        
        → 물음표 두개 붙여서 사용
        
        ```swift
        var guardJob: String
        guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
        print(guardJob) // 경비원
        yagom?.home?.guard?.job = nil
        guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
        print(guardJob) // 슈퍼맨
        ```
        
        # 타입캐스팅
        
        : 인스턴스의 타입을 확인하는 용도
        or 클래스 인스턴스를 부모/자식 클래스 타입으로 사용할 수 있는지 확인하는 용도 → is, as 사용
        
        → 타입캐스팅 사용을 위해 클래스는 상속을 통해 부모/자식 간의 관계 유지
        
        ```swift
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
        ```
        
        ### is
        
        → 타입확인
        
        ```swift
        var result: Bool
        result = yagom is Person // true
        result = yagom is Student // false
        result = yagom is UniversityStudent // false
        
        if yagom is UniversityStudent {
            print("yagom은 대학생입니다")
        } else if yagom is Student {
            print("yagom은 학생입니다")
            
        switch jason {
        case is Person:
            print("jason은 사람입니다")
        case is Student:
            print("jason은 학생입니다")
        case is UniversityStudent:
            print("jason은 대학생입니다")
        default:
            print("jason은 사람도, 학생도, 대학생도 아닙니다")
        } // jason은 사람입니다
        ```
        
        cf) case구문 : 조건문에서 확인만 함→구현부에서 재호출 필요
        
        → if let 구문 : 캐스팅과 동시에 반환받아서 인스턴스를 옵셔널 추출해서 사용
        
        ```swift
        func doSomethingWithSwitch(someone: Person) {
            switch someone {
            case is UniversityStudent:
                (someone as! UniversityStudent).goToMT()
            case is Student:
                (someone as! Student).goToSchool()
            case is Person:
                (someone as! Person).breath()
            }
        }
        func doSomething(someone: Person) {
            if let universityStudent = someone as? UniversityStudent {
                universityStudent.goToMT()
            } else if let student = someone as? Student {
                student.goToSchool()
            } else if let person = someone as? Person {
                person.breath()
            }
        }
        ```
        
        ### as
        
        1. 업캐스팅
        : as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 전환
        → Any/Anyobject 변환 가능
        → 생략가능(암시적으로 처리됨)
        
        ```swift
        // UniversityStudent 인스턴스를 생성하여 Person 행세를 할 수 있도록 업 캐스팅
        var mike: Person = UniversityStudent() as Person
        var jenny: Student = Student()
        //var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류
        // UniversityStudent 인스턴스를 생성하여 Any 행세를 할 수 있도록 업 캐스팅
        var jina: Any = Person() // as Any 생략가능
        ```
        
        1. 다운캐스팅
        : 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 인스턴스의 타입정보 전환해줌
        ex) 사람타입으로 지정됐는데 학생인 척 할 수 있는지
        
        1. 조건부 다운캐스팅 : as? + 타입
        → as? 뒤의 타입이 캐스팅하려는 타입이 아니면 nil반환
        → 결과 타입은 옵셔널로 나옴(실패가능성 내포)
        
        ```swift
        var optionalCasted: Student?
        optionalCasted = mike as? UniversityStudent
        optionalCasted = jenny as? UniversityStudent // nil
        optionalCasted = jina as? UniversityStudent // nil
        optionalCasted = jina as? Student // nil
        ```
        
        1. 강제 다운 캐스팅 : as! + 타입
        → 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 런타임 오류가 발생
        → 캐스팅에 성공하면 옵셔널이 아닌 일반 타입을 반환
        
        ```swift
        var forcedCasted: Student
        forcedCasted = mike as! UniversityStudent
        //forcedCasted = jenny as! UniversityStudent // 런타임 오류
        //forcedCasted = jina as! UniversityStudent // 런타임 오류
        //forcedCasted = jina as! Student // 런타임 오류
        ```
        
        ## 클래스(class)
        
        ```swift
        class 클래스이름 (
        	변수선언 //property(속성)
        	함수선언 //method
        }
        		
        ```
        
        - 클래스에서 생성된 인스턴스(객체)를 만들어 실제 작업에 쓸 수 있음
        - 단일상속만 가능
        - 장점
            - 관계가 있는 함수나 변수를 한 곳에 모아 넣을 수 있음
            - 프로그램의 재사용을 쉽게 할 수 있음→ 어디서나 동일한 기능 사용 가능
        
        ```swift
        class Name { //class 선언
            var name = "Song" //property
        
            func my_name() { //method
                print("my name is \(name)")
            }
        }
        
        let song : Name = Name() //클래스를 실제로 쓸 수 있도록 인스턴스로 만들어줌
        // =>  song은 Name이라는 클래스 데이터 타입을 가지게 됨
        
        print(song.name) //.을 이용하여 song이 name 속성에 접근
        song.my_name() // .이용 -> song:my_name() 메서드에 접근
        
        song.name = "kim"
        song.my_name()
        ```
        
        ### 상속(Inheritance)
        
        : 기존 클래스의 모든 기능을 이어받아 새로운 클래스를 정의하는 것 ( 클래스의 장점인 재사용을 더 넓게 응용 )
        → 이미 편리한 클래스 존재 → 상속받아서 자신의 고유한 기능을 추가한 새 클래스 형성 가능(easy~)
        
        ```swift
        class Name { //슈퍼 클래스(= 기존 클래스)
            var name = "Song" 
        
            func my_name() {
                print("my name is \(name)")
            }
        }
        
        class YourName : Name {  //클래스 상속!!
            var yourName = "Kim"
        
            func ourName() {
                print("my name is \(name) and your name is \(yourName)") //Name클래스의 속성인 name 사용
            }
        }
        
        let song : YourName = YourName()
        
        print(song.name)     //"song" 출력
        print(song.yourName) //"kim" 출력
        
        song.my_name() //song은 YourName으로 정의했지만, 클래스 상속 덕분에 my_name()메소드 사용 가능
        song.ourName()
        ```
        
        ### 클래스 초기화(Initialization)
        
        : 인스턴스를 만들 때 자동으로 호출되는 초기화 처리 전용의 메소드
        
        ```swift
        class Name {
            var name : String
            var age : Int
        
            init(name:String, age:Int) { //초기화!
                self.name = name
                self.age = age
            }
        
            func my_name() {
                print("my name is \(name) and \(age) year's old")
            }
        }
        
        let name1 : Name = Name(name: "song", age: 24)
        let name2 : Name = Name(name: "kim", age: 25)
        
        name1.my_name() //name1을 지정 후 초기화했기 때문에 let을 사용해도 오류없이 변경 가능
        name2.my_name()
        ```
        
        # 구조체(Struct)
        
        : 인스턴스의 값(property)을 저장하거나 기능(method)을 제공하고 이를 캡슐화할 수 있는 swift가 제공하는 타입(named type)
        
        ```swift
        struct Name {
            var name = "Song"
        
            func my_name() {
                print("my name is \(name)")
            }
        }
        
        var song : Name = Name()
        
        print(song.name)
        song.my_name()
        
        song.name = "kim"
        song.my_name()
        ```
        
        → 클래스 구조와 유사. 변수 = property, 함수 = method
        
        - 클래스와 다른 점
        → 상속 불가
         → 클래스는 수동으로 초기화 작업을 해서 인스턴스에 매개변수를 변경해야 했음
        → 구조체에선 자동으로 초기화해줌
        
        ```swift
        struct Name {
            var name: String = "김에나"
        
            func my_name() {
                print("my name is \(name)")
            }
        }
        
        var song : Name = Name(name: "이예나")
        
        print(song.name) //이예나
        song.my_name() //my name is 김에나
        ```
        
        ### 구조체 초기화
        
        : 수동 초기화 가능. 단, 이때는 자동 초기화 코드 제공받지 못함
        
        ```swift
        struct Name {
            var name: String = "김예나"
            var age: Int
        
            func my_name() {
                print("my name is \(name) and \(age) year's old")
            }
        
            init(name: String) {
                self.name = name
                self.age = 22
            }
        }
        
        var song : Name = Name(name: "이예나")
        
        print(song.name) //이예나
        song.my_name() //my name is 이예나 and 22 year's old
        ```
        
        # 열거형(enum)
        
        : 같은 주제로 연관된 데이터들을 멤버로 구성하여 나타내는 자료형
        
        ex) 변수를 하나하나 지정하다가 비슷한 이름끼리 헷갈릴 수도 있음 → 공통된 주제에 대해 이미 정해놓은 값만 선택해서 모아두고 사용
        
        - 장점
            - 가독성 향상
            - 오타율 하락
            - 안정성 향상
            - stack에 저장되어 heap에 저장되는 string과 달리 성능 향상
        
        ### 원시값이 없는 열거형
        
        ```swift
        enum school{ //일일이 나열
        	case classes
        	case teacher
        	case student
        	case friend
        }
        
        enum school{ // ,로 나열
        	case classes, teacher, student, friend
        }
        ```
        
        → 사용법 : 변수명.rawValue
        
        열거형을 타입처럼 사용후, .(점문법)을 이용해 내가 선언한 case에 한해서만 접근할 수 있게 !
        
        ```swift
        var daehyeon: school = .teacher
        var ios: school = .classes
        var hyeonseung: school = .friend //선언
        
        ios
        
        ios.rawValue //접근법
        ```
        
        ### 원시값이 있는 열거형
        
        : case에 값(=raw value)을 대입해주는 것
        
        **Raw Value**
        
        1. Number Type
        
        ```swift
        enum school: Int { //일일이 나열
        	case classes //0
        	case teacher //1
        	case student = 10 //10
        	case friend //11
        }
        ```
        
        → Int 타입을 명시  → 첫번째를 0으로하여 1씩 증가된 값이 들어감
        → 직접 지정도 가능(다음 case는 직접 지정한 수 + 1로 설정됨)
        
        단, Int 이외의 자료형은 모든 case에 대해 값을 지정해주어야함
        → 왜냐하면 swift는 이전 case값에서 +1(정수)를 해주는 것이 옵션인데, 바보멍청이라서 이외의 자료형은 수용하지 못하고 에러우엑함
        
        1. Character Type
        → 모든 case에 대해 값을 지정해주기!
        2. String Type
        → Raw Value 지정안해주면 case이름과 동일한 Raw Value가 자동생성됨!
        
        → 사용법 : 생성자 이용(rawValue: “이름”)
        
        ```swift
        var daehyeon = school(rawValue: "teacher")
        var ios = school(rawValue: "classes")
        ```
        
        if) 빈 RawValue값을 대입하면 → nil이 리턴됨
