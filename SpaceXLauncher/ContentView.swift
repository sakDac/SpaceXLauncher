//
//  ContentView.swift
//  SpaceXLauncher
//
//  Created by saket bhushan on 27/08/21.
//

import SwiftUI
import Apollo
struct ContentView: View {
    
    @State var tagLine = "SpaceXLauncher"
    
    var body: some View {
        Text(tagLine)
            .padding()
            .foregroundColor(.green)
            .font(.largeTitle)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height/5,
                   alignment: .center).onAppear(perform: {
                    Network.shared.client.fetch(query: GetLaunchPastQuery()) { (result) in
                        switch result {
                        case .success(let data):
                            tagLine = data.data?.launchesPast?.first??.missionName ?? "No mission name 🤔"
                        case .failure(let error):
                            print("ERROR! : \(error)")
                            
                        }
                    }
                   })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
