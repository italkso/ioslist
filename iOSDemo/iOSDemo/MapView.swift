//
//  MapView.swift
//  iOSDemo
//
//  Created by 丁海能 on 2020/6/7.
//  Copyright © 2020 Aaron Dean. All rights reserved.
//

/*
 框架集成
 在 SwiftUI 中使用 UIKit 的组件 MapKit
 采用广州市的经纬度
 */

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 23.1092, longitude: 113.319147)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
        
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
