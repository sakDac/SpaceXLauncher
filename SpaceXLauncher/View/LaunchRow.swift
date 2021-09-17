//
//  LaunchRow.swift
//  SpaceXLauncher
//
//  Created by saket bhushan on 02/09/21.
//
import Combine
import SwiftUI
import UIKit

struct LaunchRow: View {
    var launch: Launch
    var imageLoader: ImageLoader
    @State var imgData = UIImage()
    @State var missionName: String?
    @State var details: String?
    @State private var cancellables = Set<AnyCancellable>()
    
    init(launch: Launch) {
        self.launch = launch
        imageLoader = ImageLoader()
        let urlString = launch.flickrImages.first ?? "https://stackoverflow.design/assets/img/logos/so/logo-stackoverflow.png"
        imageLoader.getImageWithUrl(url: URL(string: urlString))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: .some(10.0), content: {
            Spacer(minLength: 10)
            Text(missionName ?? "")
                .font(.headline).bold()
            
                Image(uiImage: imgData)
                    .resizable()
                    .onReceive(imageLoader.$imageData, perform: { data in
                        if let inData = data, let uiImage = UIImage(data: inData) {
                            self.imgData = uiImage
                            self.missionName = launch.missionName
                            self.details = launch.details
                        }
                    }).frame(width: UIScreen.main.bounds.width,
                             height: UIScreen.main.bounds.width/2,
                             alignment: .top).clipped()
            
            Text(details ?? "")
                .font(.subheadline)
                .lineLimit(3)
            Spacer(minLength: 10)
        })
    }
}
