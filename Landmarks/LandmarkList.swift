//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jae Ki Lee on 2020/03/18.
//  Copyright © 2020 Jae Ki Lee. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @State var showFavortiesOnly = true
//    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView{
            //TableView 와 비슷한 듯 -> ForEach
            List {
                //Toggle isOn 은 showFavortiesOnly 가 true 일때
                Toggle(isOn: $showFavortiesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(landmarkData) { landmark in
                    //1.showFavoriteOnly 가 false 상태 이거나 landmark.isFavoirte 가 true 면
//                    if !self.showFavortiesOnly || landmark.isFavorite {
//                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//                            LandmarkRow(landmark: landmark)
//                        }
//                    }
                    
                    if self.showFavortiesOnly {
                        if landmark.isFavorite {
                            NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                                LandmarkRow(landmark: landmark)
                            }
                        }
                    } else {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
        .navigationBarTitle(Text("Landmarks"))
        }
    }
    
    
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
