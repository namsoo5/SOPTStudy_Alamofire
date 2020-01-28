import Foundation

let names = ["a","b","c","d","e"]
/************** *****************************************************************/

//기본클로저
let reverseBasic = names.sorted(by: {(first, second) -> Bool in
    return first > second
})
print(reverseBasic)
/********************************************************************************/
//후행클로저
//반환타입 생략가능
let reverse1 = names.sorted{ (first, second) in
    return first > second
}
print(reverse1)
/********************************************************************************/
//단축 인자 사용, 암시적 반환 표현
let reverse2 = names.sorted{ $0 > $1 }
print(reverse2)
/********************************************************************************/
//클로저가 정의된 위치의 상수나 변수를 획득할 수 있음
func makeIncrement(amount: Int) -> (() -> Int){
    var Total = 0
    func increment() -> Int {
        Total += amount
        return Total
    }
    return increment
}
let incrementByTwo = makeIncrement(amount: 2)
incrementByTwo()
incrementByTwo()
let test1 = incrementByTwo()
print(test1)
/********************************************************************************/
/*
 일회성 함수, 익명함수라고 불리는 클로저
 클로저는 참조타입
 함수형 프로그래밍에 있어서 중요
 클로저가 정의된 위치의 상수나 변수를 획득할 수 있다 => 함수안의 지역변수개념을 벗어남
 클로저를 잘사용하면 긴 코드를 간략하게 나타낼수있어서 효율적인 코딩이 가능
 
 forEach, filter, reduce, map, compactMap
 등의 고차함수를 쓰기위해서는 클로저의 개념을 어느정도 잡아야 함
 
 */
