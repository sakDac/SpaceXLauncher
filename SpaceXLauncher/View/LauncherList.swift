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
        List(launches) { launch in
            LaunchRow(launch: launch)
        }.onAppear {
            Network.shared.client.fetch(query: GetLaunchPastQuery()) { result in
                switch result {
                case .success(let resultData):
                    launches = resultData.data?.launchesPast?.compactMap { Launch(launchesPast: $0) } ?? [Launch]()
                case .failure(let error):
                    print("ERROR! \(error)")
                }
            }
        }
    }
}

struct LauncherList_Previews: PreviewProvider {
    static var previews: some View {
        LauncherList()
    }
}
