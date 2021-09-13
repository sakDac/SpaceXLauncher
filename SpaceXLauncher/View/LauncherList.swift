//
//  LauncherList.swift
//  SpaceXLauncher
//
//  Created by saket bhushan on 02/09/21.
//

import SwiftUI

struct LauncherList: View {
    @State var launches = [Launch]()
    @State var count: String
    @State var showList = false
    var body: some View {
        VStack(alignment: .center, spacing: CGFloat(20), content: {
            Text("Fetch records").font(.headline)
            TextField("Enter no of records...", text: $count, onCommit:  {
                showList = true
                fetchLaunch(count: Int(count) ?? 0)
            }).font(.headline).textFieldStyle(RoundedBorderTextFieldStyle())
            if showList {
                List(launches) { (launch) in
                    LaunchRow(launch: launch)
                }
            } else {
                Spacer()
            }
        }).padding(CGFloat(20))
    }
    
    // ⚠️ TODO: Implement pagination ⚠️
    
    func fetchLaunch(count: Int) {
        Network.shared.client.fetch(query: GetLaunchPastQuery(count: count)) { result in
            switch result {
            case .success(let resultData):
                launches = resultData.data?.launchesPast?.compactMap { Launch(launchesPast: $0) } ?? [Launch]()
            case .failure(let error):
                print("ERROR! \(error)")
            }
        }
    }
}
