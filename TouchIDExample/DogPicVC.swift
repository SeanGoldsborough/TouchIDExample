//
//  DogPicVC.swift
//  TouchIDExample
//
//  Created by Sean Goldsborough on 1/4/18.
//  Copyright © 2018 Sean Goldsborough. All rights reserved.
//

import Foundation
import UIKit

class DogPicVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func exitButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    
}
