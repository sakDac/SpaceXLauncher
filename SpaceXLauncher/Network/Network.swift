//
//  Network.swift
//  SpaceXLauncher
//
//  Created by saket bhushan on 31/08/21.
//

import Foundation
import Apollo

class Network {
    let url = URL(string: "https://api.spacex.land/graphql")
    static let shared = Network()
    lazy var client = ApolloClient(url: url!)
}
// ⚠️ TODO: use : https://stackoverflow.com/questions/56545572/how-can-i-load-an-uiimage-into-a-swiftui-image-asynchronously for image dowloading ⚠️
