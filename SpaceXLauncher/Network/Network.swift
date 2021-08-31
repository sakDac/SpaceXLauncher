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
