//
//  ViewController.swift
//  SamplePhotoLibrary
//
//  Created by swift-studying.com. on 2015/10/05.
//  Copyright © 2015年 swift-studying.com. All rights reserved.
//

import UIKit
var bttype = "1"


class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    @IBOutlet weak var imageView2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showPhotoLibrary(sender: UIButton) {
        
        bttype = "1"
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .PhotoLibrary
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    
    
    
    
    @IBAction func showPhotoLibrary2(sender: UIButton) {
        
        bttype = "2"
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .PhotoLibrary
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            presentViewController(imagePickerController, animated: true, completion: nil)
        }

    }
    
    
    
    
    
    

}

extension ViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        if let info = editingInfo, let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            if bttype == "1" {
                imageView.image = editedImage
            }
            if bttype == "2" {
                imageView2.image = editedImage
            }

        }else{
            if bttype == "1" {
                imageView.image = image
            }
            if bttype == "2" {
                imageView2.image = image
            }
        }
        ImageSenderAlamofire.postImage(image)
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}