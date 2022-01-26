# SwiftUIPractice
## SwiftUI
* 앱의 사용자 인터페이스를 선언하기 위한 View, Control, Layout을 구조체 형태로 제공한다.
* 이 framework는 Tab, Gesture, 기타 유형의 입력을 앱에 전달하기 위한 이벤트 핸들러와 앱 모델에서 사용자가 보고 상호작용을 할 View, Control에 대한 데이터 흐름을 관리하는 도구를 제공한다.
* 선언형 코드를 통해서 view를 표현하기 때문에 SwiftUI에서 view는 function of state, 즉 상태의 함수라고 표현한다.
* 즉, 표현하고자 하는 view의 속성은 상태로 표현되고 이러한 상태를 함수 형태의 인자로 전달하면 세세한 부분은 SwiftUI framework가 알아서 해석해서 view로 표현한다는 것이다.

## Property Wrapper
* SwiftUI는 데이터 흐름을 기준으로 여러 Property Wrapper라는 개념을 도입했다.
* @State
  * 데이터 흐름이 내부 (View-local)
  * 값 타입 (Value type)
  * framework 자체적으로 관리 (Framework Managed)
* @ObservableObject
  * 데이터 흐름이 외부 (External)
  * 참조 타입 (Reference type)
  * 개발자가 직접 선언체를 관리 (Developer Managed)
  
## SwiftUI Data Flow
* 외부 dependency가 없는 단일 view라고 가정할 때, 발생하는 어떤 이벤트는 User Interaction을 통한 Action이 있을 것이다.
* Action을 통한 변화는 state, 즉 상태를 변화시킬 것이고 그에 대한 업데이트가 view에 전달되는 방식일 것이다.
* 최종적으로 업데이트에 따라서 새롭게 rendering 하고 user에게 보여질 것이다.

## SwiftUI를 통한 Custom View 구현
* SwiftUI는 사용자 인터페이스 디자인에 대한 선언적 접근 방식을 제공한다.
* 기존의 명령적 접근 방식을 사용하면 controller 코드가 view를 인스턴스화, 레이아웃, 구성할 뿐만 아니라 조건이 변경되는 것에 따라서 지속적으로 업데이트 해야 하는 부담이 있다. <br>
  대조적으로, 선언적 접근 방식에서는 인터페이스가 원하는 레이아웃을 미러링하는 계층 구조에서 view를 선언하고 사용자 인터페이스에 대한 간단한 설명을 만든다.
* 그 후, SwiftUI가 사용자 입력이나 상태 변경과 같은 이벤트에 대한 응답으로 이러한 view를 그리고 업데이트 하는 것을 관리한다.
* SwiftUI는 사용자 인터페이스에서 view를 정의하고 구성하기 위한 도구를 제공한다.
>MyView.swift
  * View 프로토콜의 필수사항은 body를 정의해야 한다는 것이다.
  * SwiftUI의 View는 View를 업데이트 해야할 때마다 body 속성의 값을 읽게 된다.
  * View가 반환하는 값은 곧 SwiftUI가 화면에 그리는 요소가 된다.
  ```swift
  import SwiftUI

  struct MyView: View {
      var body: some View {
          let helloFont: Font
          // 스택 쌓기
          VStack {
              // view modifier 적용
              Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.title)
              Text("만나서 반가워요")
          }
      }
  }

  struct MyView_Previews: PreviewProvider {
      static var previews: some View {
          MyView(helloFont: .title)
      }
  }
  ```
 
  * some View
    * some View를 통해 이 body의 속성이 그냥 view를 준수함을 알 수 있다. 
    * 정확하게 어떤 유형인지는 body를 어떻게 개발하는지에 따라, 즉 body의 내용에 따라 달라진다.
    * 그래서 SwiftUI는 정확한 유형을 명시적으로 표현하지 않고 framework 단에서 자동으로 추론하도록 some View 라고 표현한다.
  * view modifier
    * body에서 view를 구성하려면 view modifier를 적용할 수 있다.
    * modifier는 특정 view에서 호출되는 메서드이다.
    * 메서드이므로 view 계층 구조에서 기존의 view를 대체하여 변경된 새 view를 반환하게 된다.
>ContentView
  * 임의로 만든 custom view를 다른 view에 통합하려면 view를 표시하고 싶은 계층의 지점에서 custome view를 선언하면 된다.
  * rootView에 별도의 타이틀이 아닌 custom한 MyView를 감싸는 형태로 표현된다.
  ```swift
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
  ```
