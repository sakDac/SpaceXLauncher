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
        VStack(alignment: .center, spacing: .some(10.0), content: {
            Text(launch.missionName).font(.headline)
            Text(launch.details).font(.body)
        })
    }
}

struct LaunchRow_Previews: PreviewProvider {
    static var previews: some View {
        LaunchRow(launch: Launch(missionName: "preview", details: "test") )
    }
}
