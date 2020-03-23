//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by Jae Ki Lee on 2020/03/20.
//  Copyright © 2020 Jae Ki Lee. All rights reserved.
//

import Combine
import SwiftUI

//SwiftUI 에서는 observableObject 를 이용해 변화를 감지한다.
final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
