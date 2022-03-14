//
//  ImageVC.swift
//  TweeterTags
//
//  Created by 罗俊豪 on 13/03/2022.
//

import UIKit

class ImageVC: UIViewController {
    @IBOutlet weak var image: UIImageView!
    var newImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = newImage
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
