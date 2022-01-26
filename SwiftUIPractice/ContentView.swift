//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 노민경 on 2022/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 임의로 만든 custom view를 다른 view에 통합하려면 view를 표시하고 싶은 계층의 지점에서 custome view를 선언하면 된다.
        MyView(helloFont: .title) // rootView에 별도의 타이틀이 아닌 custom한 MyView를 감싸는 형태로 표현된다.
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
