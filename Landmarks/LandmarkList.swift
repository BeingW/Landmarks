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
        NavigationView {
            //모델이 identifier type 이면 (landmarkData, id: \.id) id 를 해주지 않아도 된다.
            List(landmarkData) { landmark in
                LandmarkRow(landmark: landmark)
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
