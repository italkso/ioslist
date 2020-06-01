//
//  InfoAboutLiBai.swift
//  iOSDemo
//
//  Created by 丁海能 on 2020/6/1.
//  Copyright © 2020 Aaron Dean. All rights reserved.
//

import SwiftUI

struct InfoAboutLiBai: View {
    var body: some View {
        NavigationView{
            VStack(alignment:.center,spacing: 20){
                       Image("Libai_touxiang")
                           .resizable()
                           .clipShape(RoundedRectangle(cornerRadius: 10))
                           .padding()
                       Text("""
                       大家好我是李白。
                       蜀道难,将进酒都是我写的。
                       但不是我让你们背的。
                       """)
                           .font(.title)
                           .foregroundColor(.primary)
            }
            .navigationBarTitle(Text("李白自我介绍"),displayMode: .inline)
        }
    }
}

struct InfoAboutLiBai_Previews: PreviewProvider {
    static var previews: some View {
        InfoAboutLiBai()
    }
}

