//
//  ImageLoader.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 14/04/21.
//

import Foundation
import UIKit

class ImageLoader: UIImageView {
    
    var imageUrlString: String?
    let imageCache = NSCache<NSString, UIImage>()
    
    func loadImage(from url: URL, completion: ((Error?)-> Void)? = nil) {
        
        imageUrlString = url.absoluteString
        image = nil
        
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            image = cachedImage
            completion?(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion?(error)
                return
            }
            guard let data = data else {
                completion?(NSError(domain: "", code: 000, userInfo: nil))
                return
            }
            DispatchQueue.main.async {
                guard let downloadedImage = UIImage(data: data) else {
                    completion?(NSError(domain: "", code: 000, userInfo: nil))
                    return
                }
                if (self.imageUrlString?.elementsEqual(url.absoluteString) ?? false) {
                    self.image = downloadedImage
                }
                self.imageCache.setObject(downloadedImage, forKey: url.absoluteString as NSString)
                completion?(nil)
            }
            
        }.resume()
    }
}
