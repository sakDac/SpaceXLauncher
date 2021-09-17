//
//  ImageDownloderUtil.swift
//  SpaceXLauncher
//
//  Created by saket bhushan on 13/09/21.
//
import Combine
import SwiftUI

class ImageLoader {
    @Published var imageData: Data?
    private let cache = NSCache<NSURL, NSData>()
    private var cancellables = Set<AnyCancellable>()
    
    func getImageWithUrl(url: URL?) {
        guard let url = url else {
            return
        }
        if let data = cache.object(forKey: url as NSURL) {
            imageData = data as Data
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let data = $0 else {
                    return
                }
                self?.cache.setObject(data as NSData, forKey: url as NSURL)
                self?.imageData = data
            }
            .store(in: &cancellables)
    }
}
