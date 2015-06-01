//
//  ManagePhotos.swift
//  Photo Picker Test
//
//  Created by Nicholas Schirmer on 6/1/15.
//  Copyright (c) 2015 Shiny New Software, LLC. All rights reserved.
//

import Foundation
import UIKit

protocol ManagePhotosDelegate : class {
    func managePhotosImageChosen(image: UIImage)
    func managePhotosPresentController(controller: UIViewController)
}

class ManagePhotos: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var delegate: ManagePhotosDelegate?
    let imagePicker = UIImagePickerController()
    
    override init() {
        super.init()
        imagePicker.delegate = self
    }
    
    func presentChoiceAlert() {
        let alert = UIAlertController()

        let libraryAction = UIAlertAction(title: "Choose from Library", style: .Default, handler: choosePhotoFromLibrary)
        alert.addAction(libraryAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let cameraAction = UIAlertAction(title: "Take Photo", style: .Default, handler: snapNewCameraPhoto)
            alert.addAction(cameraAction)
        }
        delegate?.managePhotosPresentController(alert)
    }
    
    func choosePhotoFromLibrary(action: UIAlertAction!) {
        imagePicker.sourceType = .PhotoLibrary

        delegate?.managePhotosPresentController(imagePicker)
    }
    
    func snapNewCameraPhoto(action: UIAlertAction!) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        imagePicker.cameraCaptureMode = .Photo
        delegate?.managePhotosPresentController(imagePicker)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        delegate?.managePhotosImageChosen(image)
    }
    
}