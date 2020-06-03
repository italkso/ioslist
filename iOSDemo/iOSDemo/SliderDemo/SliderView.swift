//
//  SliderView.swift
//  iOSDemo
//
//  Created by 丁海能 on 2020/6/3.
//  Copyright © 2020 Aaron Dean. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    @State private var value: Double = 123

    var label: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text("\(label): \(Int(value))")
            Slider(value: $value, in: 0...255,step: 1.0)
        }.padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(label: " 标签名称")
    }
}
