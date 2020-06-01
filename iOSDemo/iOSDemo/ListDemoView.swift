//
//  ListDemoView.swift
//  iOSDemo
//
//  Created by 丁海能 on 2020/6/1.
//  Copyright © 2020 Aaron Dean. All rights reserved.
//

/*
 主要内容:
 - 使用 ForEach 循环列表项内容
 - 使用 .onMove(perform: )移动列表项目(主要)
 - 使用 UITableView.appearance().separatorStyle = .none 隐藏列表的分隔横线
 - 使用 Spacer(minLength: ) 给底部留白
 - 使用 displayMode 控制 NavigationBarTitle 的显示:.automatic靠左,.inline居中

说明:
 - 除"飞行者 1 号"外,其余飞行器名称都是为了 Demo 需要杜撰的.
*/

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
                    //文本容器样式
                }
                .onMove(perform: moveListItem)
                //移动列表项目
            }
            .navigationBarTitle(Text("List 演示"),displayMode: .inline)
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(action: {
                    //添加点击 Button 的需要执行的动作
                }){
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large).foregroundColor(.orange)
                }
            )
            .onAppear { UITableView.appearance().separatorStyle = .none }
            //去掉 List 项目之间的分隔线
        }
            Spacer(minLength: 20)//底部留白
            Text("- Findaaron -").font(.footnote)
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

