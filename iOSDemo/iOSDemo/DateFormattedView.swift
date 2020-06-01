//
//  DateFormattedView.swift
//  iOSDemo
//
//  Created by 丁海能 on 2020/6/1.
//  Copyright © 2020 Aaron Dean. All rights reserved.
//

/*
 时间输出格式化
 */

import SwiftUI

struct DateFormattedView: View {
     var currentTime = Date()
       
       var body: some View {
               let formattedCurrentTime = getFormattedDate(format: "yyyy.MM.dd HH:mm:ss")
           
               return Text("\(formattedCurrentTime)")
                       .padding()
                       .font(.largeTitle)
                       .foregroundColor(.white)
                       .clipShape(Capsule())
                       .background(Color.blue)
                       .cornerRadius(15)
       }
       
       func getFormattedDate(format: String) -> String {
           let dateformat = DateFormatter()
           dateformat.dateFormat = format
           return dateformat.string(from: currentTime)
       }
}

struct DateFormattedView_Previews: PreviewProvider {
    static var previews: some View {
        DateFormattedView()
    }
}
