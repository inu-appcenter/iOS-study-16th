# 음악 검색 앱 구현

## 주요 기능 - 네트워크 통신
- 애플 뮤직(itunes) API 
GET 방식으로 사용 
`https://itunes.apple.com/search?media=music&term={searchTerm}`
- 동기/ 비동기 
 `@escaping closure` 를 사용하지 않고 `async, await` 사용
- `URLSession`

## Flow 
<p align="center"><img src="https://github.com/inu-appcenter/iOS-study-16th/assets/109841880/f765ddb5-b2cc-4286-881b-2665aebcb4c6" width="700" height="400"></p>

## 시연 화면
### 영상

https://github.com/inu-appcenter/iOS-study-16th/assets/109841880/db570ae2-72e8-400d-a99a-7b20476ef2e7

### 초기화면
<p align="center"><img src="https://github.com/inu-appcenter/iOS-study-16th/assets/109841880/f2fd21de-2a88-46d9-a244-c94e623adf49" width="400" height="700"></p>

### 검색화면 
<p align="center"><img src="https://github.com/inu-appcenter/iOS-study-16th/assets/109841880/0cb1df24-e2f8-4fe5-b8bd-bc0e4b152857" width="400" height="700"></p>

