//
//  MapView.swift
//  Landmarks
//
//  Created by Jae Ki Lee on 2020/03/18.
//  Copyright © 2020 Jae Ki Lee. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    //1.UIView 를 만들어 화면에 뿌린다.
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    //2.UIView 를 업데이트 한다.
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        let coordinate = CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
