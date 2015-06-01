//
//  ViewController.swift
//  Photo Picker Test
//
//  Created by Nicholas Schirmer on 6/1/15.
//  Copyright (c) 2015 Shiny New Software, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ManagePhotosDelegate {
    
    var managePhotos = ManagePhotos()
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        managePhotos.delegate = self
    }

    @IBAction func addPhotoBtn(sender: UIButton) {
        managePhotos.presentChoiceAlert()
    }
    
    func managePhotosImageChosen(image: UIImage) {
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func managePhotosPresentController(controller: UIViewController) {
        self.presentViewController(controller, animated: true, completion: nil)
    }
}

