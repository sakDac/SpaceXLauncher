//
//  LauncherList.swift
//  SpaceXLauncher
//
//  Created by saket bhushan on 02/09/21.
//

import SwiftUI

struct LauncherList: View {
    @State var launches = [Launch]()
    var body: some View {
        VStack {
            List(launches) { (launch) in
                LaunchRow(launch: launch)
            }.onAppear {
                fetchLaunch(count: 2)
            }
        }
    }
    func fetchLaunch(count: Int) {
        Network.shared.client.fetch(query: GetLaunchPastQuery(count: 2)) { result in
            switch result {
            case .success(let resultData):
                launches = resultData.data?.launchesPast?.compactMap { Launch(launchesPast: $0) } ?? [Launch]()
            case .failure(let error):
                print("ERROR! \(error)")
            }
        }
    }
}
