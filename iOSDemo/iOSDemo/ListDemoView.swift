import SwiftUI

struct ListDemoView: View {
    //预留数据
    @State private var aircrafts = ["飞行者 1 号", "临空者  1 号", "寻路者 1 号","翼轻航 1 号","飞行者 2 号", "临空者 2 号", "寻路者 2 号","翼轻航 2 号","飞行者 3 号", "临空者 3 号", "寻路者 3 号","翼轻航 3 号"]

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
            }
            .navigationBarTitle(Text("List 演示"),displayMode: .inline)
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(action: {
                    //
                }){
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large).foregroundColor(.orange)
                }
            )
            .onAppear { UITableView.appearance().separatorStyle = .none }
        }
            Spacer(minLength: 20)
            Text("- italkso -").font(.footnote)
    }
    }

    func moveListItem(from source: IndexSet, to destination: Int) {
        aircrafts.move(fromOffsets: source, toOffset: destination)
    }//移动列表项目的函数
}

struct ListDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ListDemoView()
    }
}

