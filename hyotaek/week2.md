### 1. 데이터 타입
- Any : 어떤 타입이든 할당 가능
- AnyObject : 모든 클래스 타입 지칭
- nil : 값이 없음을 의미
<hr>

### 2. 컬렉션 타입
#### * 컬렉션이란?
	쉽게 말해 데이터들의 집합. 같은 타입의 데이터들을 묶어서 사용하기 위해 컬렉션이 필요하다.
- Array : 순서가 있는 리스트 컬렉션
- Dictionary : 키와 값의 쌍으로 이루어진 컬렉션
- Set : 순서 없고, 멤버가 유일한 컬렉션
<hr>
  
### 3. 함수
<hr>

### 4. 옵셔널, 옵셔널 체이닝, 타입 캐스팅
#### 옵셔널
* 옵셔널이란?
	* 값이 있을수도, 없을수도 있다는 의미
	<br>
	* 왜 필요할까?
		* nil의 가능성을 문서화 하지 않고 코드만으로 표현 가능 -> 문서, 주석 작성 시간 절약
		* 전달 받은 값이 옵셔널이 아니라면 nil체크를 하지 않아도 됨 -> 효율적임, 예외 상황을 최소화할 수 있음

* 옵셔널 언래핑
	* 강제 추출
		* 런타임 에러가 발생할 수 있으므로 추천x
	* 옵셔널 바인딩
		* nil체크 후 안전하게 값 추출 가능

#### 옵셔널 체이닝
* 옵셔널 체이닝이란?
	* 옵셔널을 물음표 연산자로 연속적으로 묶은 것
* 왜 사용해야 하는가?
	* 옵셔널을 계속 확인해야 하므로 코드가 이상하게 중첩될 수 있음
```swift
func() {
	if let {
		if let {
			if let {
				if let { }
				else {}
			}
		}
	}
}
```
<br>

* 예시 코드 1
```swift
yagom?.home?.guard?.job //  nil 반환
```
	야곰의 home이 nil인 상태이므로 guard와 job은 확인하지 않고 바로 nil 반환
<br>

* 예시 코드 2
```swift
guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
// guard의 jobdl nildlamfh "슈퍼맨"을 할당
```
	옵셔널 값이 nil일 경우, 우측의 값을 반환함
<br>

#### 타입 캐스팅
* 업캐스팅
	* 해당 클래스의 부모 클래스로 변환하는 것
	* 클래스의 상속 구조에서 부모 클래스로 타입을 변환하는 것

* 다운 캐스팅
	* 상위 클래스 타입의 인스턴스를 하위 클래스 타입으로 변환하는 것

	* 조건부 다운 캐스팅
		* as?를 사용함.
		* 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 nil을 반환
		* 캐스팅 성공 시 옵셔널 타입 반환

	* 강제 다운 캐스팅
		* as!를 사용
		* 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 런타인 에러 발생
		* 캐스팅 성공 시 일반 타입 반환
<hr>

### 5. 구조체, 클래스, 열거형

#### 구조체 (값 타입)
* 구조체 구성
	* 프로퍼티
		* 가변 프로퍼티
		* 불변 프로퍼티
			* 외부에서 접근하여 값 변경하려고 하면 에러
		* 타입 프로퍼티
	* 메서드
		* 인스턴스 메서드
		* 타입 메서드

* 특징
	* let으로 선언된 구조체는 가변 프로퍼티도 수정 불가
	* var로 선언된 구조체는 가변 프로퍼티 수정 가능

#### 클래스 (참조 타입)
* 구조체와 크게 다르지 않음
* 특징
	* 구조체와는 다르게 let으로 선언된 클래스의 가변 프로퍼티 수정 가능

#### 열거형

* 원시값
	* 정수값 가질 수 있음
	* washable 프로토콜을 따르는 모든 타입이 원시값으로 지정 가능
```swift
enum Fruit: Int { 
	case apple =  0  
	case grape =  1  
	case peach  
}

enum School: String { 
	case elementary =  "초등"  
	case middle =  "중등"  
	case high =  "고등"  
	case university 
}
```

* 메서드도 추가 가능
```swift
enum Month { 
	case dec, jan, feb 
	case mar, apr, may 
	case jun, jul, aug 
	case sep, oct, nov 

	func printMessage() { 
		switch  self { 
			case .mar, .apr, .may: print("따스한 봄~") 		
			case .jun, .jul, .aug: print("여름 더워요~") 
			case .sep, .oct, .nov: print("가을은 독서의 계절!") 
			case .dec, .jan, .feb: print("추운 겨울입니다") 
		} 
	} 
```
<hr>

### 6. assert, guard

#### assert
* 디버깅 모드에서만 동작
```swift
assert(someInt ==  0, "someInt != 0")
// someInt가 0이라면 계속 동작, 0이 아니라면 중지후 에러 메시지
```

#### guard
* if-else문과 비슷
* assert와 다르게 디버깅 모드 뿐 아니라 어떤 조건에서도 동작
* 타입 캐스팅, 옵셔널 바인딩에서도 자주 사용
```swift
guard let input else { return }
print(input)
// input이 nil이 아니라면 input 출력, nil이라면 return
```

```swift
func someFunction(info: [String: Any]) { 
	guard  let name = info["name"] as?  String  else { return }
	print(name)
}
// name에 값이 있는지 확인 후 String으로 타입 캐스팅.
// 성공하면 name 출력, 실패하면 return
```