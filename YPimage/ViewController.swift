//
//  ViewController.swift
//  YPCustomizationTutorial
//
//  Created by Chander Bhushan on 28/10/19.
//  Copyright © 2019 Swift Series. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var config = YPImagePickerConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var config = YPImagePickerConfiguration()
        config.library.mediaType = .photo
        config.shouldSaveNewPicturesToAlbum = false
        config.startOnScreen = .library
        config.screens = [.library]
        //config.library.onlySquare = true

        config.hidesStatusBar = false
        config.hidesBottomBar = false
        config.library.maxNumberOfItems = 1
        config.bottomMenuItemSelectedTextColour = UIColor(r: 38, g: 38, b: 38)
        config.bottomMenuItemUnSelectedTextColour = UIColor(r: 153, g: 153, b: 153)

        let picker = YPImagePicker(configuration: config)
        
        picker.modalPresentationStyle = .fullScreen
        present(picker, animated: true, completion: nil)

       
//        config.bottomMenuItemSelectedColour = UIColor(r: 38, g: 38, b: 38)
//        config.bottomMenuItemUnSelectedColour = UIColor(r: 153, g: 153, b: 153)
    }
    
    
    @IBAction func clickedBtnShowImagePicker(_ sender: Any) {
        
        
        
        let picker = YPImagePicker(configuration: config)
        
        
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
//                print(photo.modifiedImage) // Transformed image, can be nil
//                print(photo.exifMeta) // Print exif meta data of original image.
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
    
}

