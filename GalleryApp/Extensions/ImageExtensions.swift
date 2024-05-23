//
//  ImageExtensions.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 17/02/24.
//

import Foundation
import UIKit


let cacheObject = NSCache<AnyObject, UIImage>()

extension UIImageView {
    
    func loadImageFromUrl(urlString: String) {

        if (urlString == "") {
            return
        }
        let url = URL(string: urlString)!
        let imageFromCache = cacheObject.object(forKey: urlString as AnyObject)
        if let imageFromCache = imageFromCache {
            print("Image loaded from cache")
            self.image = imageFromCache
            return
        }
        print("loaded from Url: ", urlString)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage (data: data) {
                    cacheObject.setObject(image, forKey: urlString as AnyObject)
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
