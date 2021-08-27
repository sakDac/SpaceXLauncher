//
//  ContentView.swift
//  SpaceXLauncher
//
//  Created by saket bhushan on 27/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("SpaceXLauncher")
            .padding()
            .foregroundColor(.green)
            .font(.largeTitle)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height/5,
                   alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
