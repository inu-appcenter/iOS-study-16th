//
//  ImageFileManager.swift
//  ContactApp
//
//  Created by 한현승 on 5/21/24.
//

import Foundation
import UIKit


class ImageFileManager {
    // 싱글톤
    static let shared: ImageFileManager = ImageFileManager()
    
    
    func saveImage(image: UIImage, name: String, onSuccess: @escaping((Bool)-> Void)){
        guard let data: Data = image.pngData() else {return}
        
        if let directory: NSURL = try? FileManager.default.url(for: .documentDirectory,
                                                               in: .userDomainMask,
                                                               appropriateFor: nil,
                                                               create: false) as NSURL {
            do{
                try data.write(to: directory.appendingPathExtension(name)!)
                onSuccess(true)
            } catch let err as NSError {
                print("Could not saveImage: \(err), \(err.userInfo)")
                onSuccess(false)
            }
        }
    }
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir: URL = try? FileManager.default.url(for: .documentDirectory,
                                                       in: .userDomainMask,
                                                       appropriateFor: nil,
                                                       create: false) {
            let path: String 
                = URL(fileURLWithPath: dir.absoluteString)
                    .appendingPathComponent(named).path
            
            let image: UIImage? = UIImage(contentsOfFile: path)
            
            return image
        }
        return nil
    }
}
