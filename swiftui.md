## SwiftUI

Text, Textfield, Image, SFSymbol, Stack View, ScrollView, TabView, Animation, List, Navigation, Form, Section, Button, Alert



### Text

```swift
Text("Hello, World!")
	.foregroundColor(.white)	
	.font(.largeTitle)			
 	.fontWeight(.black)
```



### Image

```swift
Image("Libai")
    .resizable()
    .frame(width: 120, height: 120)
    .clipShape(Circle())
    .overlay(Capsule().stroke(Color.black, lineWidth: 1))
    .shadow(color: .orange, radius: 1)
```

- `resizable`：`.tile` or `.stretch`
- `scaledToFit` , `aspectRatio(contentMode: .fill)`,  `scaledToFill`：  
- `clipShape`： `Circle()`, `Ellipse()` , `Capsule()`
- `cornerRadius`：`.infinity`
- `shadow`: call `cornerRadius` first, then call `shadow`
- `.renderingMode(.original)`: keep image buttons  their original styles .




### List

- `ForEach`
- `.onMove(perform: )`
- `UITableView.appearance().separatorStyle = .none`
- `Spacer(minLength: )`
- `displayMode`: `.inline` or `.automatic`

```swift
import SwiftUI

struct ListDemoView: View {
    @State private var aircrafts = [0,1,2,3,4,5,6]

    var body: some View {
        VStack{
        NavigationView {
            List {
                ForEach(aircrafts, id: \.self) { aircraft in
                    Text(aircraft)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .background(Color.init(red: 245/255, green: 246/255, blue: 250/255))
                        .cornerRadius(8)
                }
                .onMove(perform: moveListItem)
                //Move list item
            }
            .navigationBarTitle(Text("List Demo"),displayMode: .inline)
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(action: {
                    //Button action
                }){
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large).foregroundColor(.orange)
                }
            )
            .onAppear { UITableView.appearance().separatorStyle = .none }
            //Hide separator style of the list
        }
            Spacer(minLength: 20)	//Spacer
            Text("- Findaaron -").font(.footnote)
    }
    }

    func moveListItem(from source: IndexSet, to destination: Int) {
        aircrafts.move(fromOffsets: source, toOffset: destination)
    }//moveListItem()
}

struct ListDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ListDemoView()
    }
}
```



### Gestures

- **onTapGesture**

  ```swift
  Text("Click")
  	.onTapGesture(){
   	print("Click")
  	}
  
  Text("Double Click")
      .onTapGesture(count: 2){
         print("Double Click")
  	}
  ```

- **onLongPressGesture**

  ```swift
  Text("Long Press")
    	.onLongPressGesture {
     	 print("Long Press")
  }//Default 0.5 seconds
  
  Text("Long Press")
       .onLongPressGesture(
             minimumDuration: 4,
             pressing: {isPressing in
                print(isPressing)
         }){
        	print("You could see this only if you press the screen more than 4 seconds.")
    		}
  ```

- **MagnificationGesture**

  ```swift
  Text("Magnification")
    .gesture(
           MagnificationGesture()
                  .onChanged{ amount in
                      self.currentAmount = amount
                  }
                  .onEnded{ amount in
                      self.currentAmount = 1
                  }
     )
  ```

- **RotationGesture**

  ```swift
  Text("Rotation")
  	.gesture(
           RotationGesture()
           	.onChanged{ angle in
                 	self.currentAngle = angle
               }
              .onEnded{angle in
                  self.currentAngle = .degrees(0)
              }
  	)
  ```

- **Combination Gestures**

  ```swift
  import SwiftUI
  struct GesturesBasic: View {
  
  	@State private var currentAmount: CGFloat = 1
  	@State private var currentAngle: Angle = .degrees(0)
  	@State private var offset: CGSize = .zero
  	@State private var longpressed = false
  
  	var body: some View {
  	
  	let dragGesture = DragGesture()
              .onChanged{ value in
                  self.offset = value.translation
          }
          .onEnded{ _ in
              withAnimation{
                  self.offset = .zero
                  self.longpressed = false
              }
          }
          
      let longPressGesture = LongPressGesture()
              .onEnded{ _ in
                  withAnimation{
                      self.longpressed = true
                  }
          }
  
  	Circle()
       .fill(Color.green)
       .frame(width:60, height: 60)
       .scaleEffect(longpressed ? 1.5 : 1)
       .offset(offset)
       .gesture(longPressGesture.sequenced(before: dragGesture))
  	}
  }
  ```

- **Priority**

  ```swift
  // 2. 
  VStack{
       Text("Subview")
       	.onTapGesture {
          	print("Subview first")
           }//Subview first
  }
  .highPriorityGesture(
        TapGesture()
         	.onEnded{ _ in
            print("Superview first")
          }
  )//Change priority using highPriorityGesture
  
  VStack{
       Text("Subview")
       	.onTapGesture {
          	print("Subview first")
           }
  }
  .simultaneousGesture(
        TapGesture()
         	.onEnded{ _ in
            	print("same priorities")
          }
  )//simultaneousGesture
  ```

- **allowHitTesting**

  ```swift
  Text("allowHitTesting")
      .onTapGesture {
            print("You can not see this because of allowsHitTesting is false")
       }
      .allowsHitTesting(false)
  ```

- **contentShape**

  ```swift
  //	 .contentShape(Rectangle())
  Circle()
       .fill(Color.primary)
       .frame(width: 300, height: 300)
       .contentShape(Rectangle())
       .onTapGesture {
             print("The part outside the circle is also regarded as a circle trigger.")
       }
  
  
  //	Spacer
  VStack{
       Text("Spacer")
       Spacer().frame(height: 100)
       Text("Spacer")
       }
        .padding()
        .contentShape(Rectangle())
        .onTapGesture {
                  print("VStack is clicked.")
  }
  ```

  