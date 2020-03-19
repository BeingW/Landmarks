//
//  CircleImage.swift
//  Landmarks
//
//  Created by Jae Ki Lee on 2020/03/18.
//  Copyright © 2020 Jae Ki Lee. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
        .clipShape(Circle())
        .overlay(
            Circle().stroke(Color.gray, lineWidth: 4)
        .shadow(radius: 10)
            
        )
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
