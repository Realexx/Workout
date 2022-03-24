//
//  WorkoutsView.swift
//  Workout
//
//  Created by schlageter alex on 04/03/2022.
//

import SwiftUI

struct WorkoutsView: View {
    @State var mapViewModel : MapViewModel
    
    var body: some View {
        mapView(mapData: mapViewModel.maps.last!)
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView(mapViewModel: MapViewModel())
    }
}
