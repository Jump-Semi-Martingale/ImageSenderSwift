//
//  ImageSenderAlamofire.swift
//  SamplePhotoLibrary
//
//  Created by 橋本欣典 on 2016/09/10.
//  Copyright © 2016年 swift-studying.com. All rights reserved.
//

import UIKit
import Alamofire

class ImageSenderAlamofire: NSObject {
    
    // 保存ボタンが押されたときに呼ばれるメソッドを定義
    class func postImage(image: UIImage) {
        
        // HTTP通信
        //let data = UIImageJPEGRepresentation(image, 0.5)
        let URL="https://hogehogeoppai.com"
        let parameters = [
            "par1": "value",
            "par2": "value2"]
        Alamofire.upload(.POST, URL,
                         // define your headers here
            headers: ["Authorization": "auth_token"],
            multipartFormData: { multipartFormData in
                
                // import image to request
                if let imageData = UIImageJPEGRepresentation(image, 1) {
                    multipartFormData.appendBodyPart(data: imageData, name: "file", fileName: "myImage.png", mimeType: "image/png")
                }
                
                // import parameters
                for (key, value) in parameters {
                    multipartFormData.appendBodyPart(data: value.dataUsingEncoding(NSUTF8StringEncoding)!, name: key)
                }
            }, // you can customise Threshold if you wish. This is the alamofire's default value
            encodingMemoryThreshold: Manager.MultipartFormDataEncodingMemoryThreshold,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .Success(let upload, _, _):
                    upload.responseJSON { response in
                        debugPrint(response)
                    }
                case .Failure(let encodingError):
                    print(encodingError)
                }
        })
    }
}