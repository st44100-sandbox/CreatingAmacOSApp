//
//  LandmarkList.swift
//  MacLandmarks
//
//  Created by st44100 on 2020/04/11.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData
    @Binding var selectedLandmark: Landmark?
    
    var body: some View {
        List(selection: $selectedLandmark) {
            ForEach(userData.landmarks) {
                landmark in
                if(!self.userData.showFavoritesOnly || landmark.isFavorite) {
                    LandmarkRow(landmark: landmark).tag(landmark)

                }
            }
        }
    }

}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList(selectedLandmark: .constant(landmarkData[0]))
        .environmentObject(UserData())
        
    }
}
