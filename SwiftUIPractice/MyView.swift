//
//  MyView.swift
//  SwiftUIPractice
//
//  Created by 노민경 on 2022/01/26.
//

import SwiftUI

// View 프로토콜의 필수사항은 body를 정의헤야 한다는 것이다.
// SwiftUI의 View는 view와 view를 업데이트 해야할 때마다 body 속성의 값을 읽게 된다.
// 업데이트 되는 view는 일반적으로 사용자의 입력 또는 시스템 이벤트에 대한 응답으로 view 수명도가 반복적으로 발생한다.
// view가 반환하는 값은 곧 SwiftUI가 화면에 그리는 요소가 된다.
struct MyView: View {
    // some View를 통해 이 body의 속성이 그냥 view를 준수함을 알 수 있음.
    // 정확하게 어떤 유형인지는 body를 어떻게 개발하는지에 따라 달라짐, 즉 body의 내용에 따라 달라짐
    // 그래서 SwiftUI는 정확한 유형을 명시적으로 표현하지 않고 framework 단에서 자동으로 추론하도록 some View 라고 표현한다.
    var body: some View {
        // 스택 쌓기
        VStack {
            // body에서 view를 구성하려면 view modifier를 적용할 수 있다.
            // modifier는 특정 view에서 호출되는 메서드이다.
            // 따라서 메서드이므로 view 계층 구조에서 기존의 view를 대체하여 변경된 새 view를 반환하게 된다.
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.title)
            Text("만나서 반가워요")
        }
    }
    
    let helloFont: Font
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(helloFont: .title)
    }
}
