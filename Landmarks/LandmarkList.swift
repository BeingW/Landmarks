//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jae Ki Lee on 2020/03/18.
//  Copyright © 2020 Jae Ki Lee. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
//        List {
//            LandmarkRow(landmark: landmarkData[0])
//            LandmarkRow(landmark: landmarkData[1])
//        }
        //List 에 매개변수를 마음대로 넣을 수 있나? (\. 를 넣으면 매개변수에 들어간 객체의 변수를 가져올수 있다.)
//        List(landmarkData, id: \.id) { landMark in
//            LandmarkRow(landmark: landMark)
//        }
        //Model 에 Identifiable 타입을 부여하면 id 를 넣지 않아도 된다.
        NavigationView{
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
                
            }
        .navigationBarTitle(Text("Landmarks"))
        }
        
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
