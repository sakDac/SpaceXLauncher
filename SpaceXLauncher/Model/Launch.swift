//
//  LauncherModel.swift
//  SpaceXLauncher
//
//  Created by saket bhushan on 02/09/21.
//

import Foundation
import Apollo

struct Launch: Identifiable {
    var id = UUID()
    let missionName: String
    let details: String
}

extension Launch {
    init?(launchesPast: GetLaunchPastQuery.Data.LaunchesPast?) {
        self.missionName = launchesPast?.missionName ?? "No mission name"
        self.details = launchesPast?.details ?? "No details"
    }
}
