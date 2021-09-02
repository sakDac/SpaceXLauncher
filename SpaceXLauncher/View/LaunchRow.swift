//
//  LaunchRow.swift
//  SpaceXLauncher
//
//  Created by saket bhushan on 02/09/21.
//

import SwiftUI

struct LaunchRow: View {
    var launch: Launch
    var body: some View {
        Text(launch.missionName)
    }
}

struct LaunchRow_Previews: PreviewProvider {
    static var previews: some View {
        LaunchRow(launch: Launch(missionName: "preview") )
    }
}