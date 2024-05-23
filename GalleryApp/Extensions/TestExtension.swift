//
//  TestExtension.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 02/04/24.
//

import Foundation
import UIKit


let cacheObjectOne = NSCache<AnyObject, UIImage>()

extension UIImageView {
    
    
    func loadDataImage(url: String) {
        
        let imageIs = cacheObjectOne.object(forKey: url as AnyObject)
        
        if let imageNew = imageIs {
            self.image = imageNew
            return
        }
        do {
            if let data = try? Data(contentsOf: URL(string: url)!) {
                if let image = UIImage(data: data) {
                    cacheObjectOne.setObject(image, forKey: url as AnyObject)
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
        
    }
    
    
}


class testNewOne {
    
    let blockOne = BlockOperation {
        // Download Task
    }

    let blockTwo = BlockOperation {
        // Download Task
    }
    
    func downloadBooks() {
        var queue = OperationQueue()
        queue.addOperations([blockOne,blockTwo], waitUntilFinished: false)
    }
}


