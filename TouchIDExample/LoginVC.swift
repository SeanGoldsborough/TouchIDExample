//
//  LoginVC.swift
//  TouchIDExample
//
//  Created by Sean Goldsborough on 1/4/18.
//  Copyright © 2018 Sean Goldsborough. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication
import AudioToolbox

class LoginVC: UIViewController {
    
    @IBAction func touchButton(_ sender: Any) {
        let context: LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Use TouchID Now", reply: { (success, error) in
                if success {
                    print("successful login with touchID")
                    AudioServicesPlaySystemSound(1520) // Actuate `Pop` feedback (strong boom)
                    let dogPicVC = self.storyboard!.instantiateViewController(withIdentifier: "DogPicVC")
                    dogPicVC.modalTransitionStyle = .crossDissolve
                    self.present(dogPicVC, animated: true, completion: nil)
                    
                    
                } else {
                    print("can't login with touchID")
                    AudioServicesPlaySystemSound(1521) // Actuate `Nope` feedback (series of three weak booms)
                    AlertView.alertMessage(view: self, title: "ERROR", message: "Unable to login with TouchID. Please try again.", numberOfButtons: 0, leftButtonTitle: "OK", leftButtonStyle: 0, rightButtonTitle: "", rightButtonStyle: 1)
                }
            })
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
