//
//  VibrateButtonVC.swift
//  TouchIDExample
//
//  Created by Sean Goldsborough on 1/4/18.
//  Copyright © 2018 Sean Goldsborough. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox
import _SwiftUIKitOverlayShims

class VibrateButtonVC: UIViewController {
    var i = 0
    
    @IBAction func vibeButton(_ sender: Any) {
        tapped()
 //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    @IBOutlet weak var vibrateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        
        generator.impactOccurred()
        
        
        
//         let btn = UIButton()
//
//
//        btn.setTitle("Tap here!", for: .normal)
//        btn.setTitleColor(UIColor.red, for: .normal)
//        btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
//
//        view.addSubview(btn)
    }

    
    @objc func tapped() {
        i += 1
        print("Running \(i)")
        
        switch i {
        case 1:
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.error)
            AudioServicesPlaySystemSound(1517) // Actuate `Peek` feedback (weak boom)
            
        case 2:
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.success)
             AudioServicesPlaySystemSound(1518) // Actuate `Pop` feedback (strong boom)
            
        case 3:
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.warning)
            AudioServicesPlaySystemSound(1516) // Actuate `Nope` feedback (series of three weak booms)

            
        case 4:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.prepare()
            generator.impactOccurred()
            AudioServicesPlaySystemSound(1515) // Actuate `Peek` feedback (weak boom)
            
        case 5:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.prepare()
            generator.impactOccurred()
            AudioServicesPlaySystemSound(1519) // Actuate `Nope` feedback (series of three weak booms)
             AudioServicesPlaySystemSound(1520) // Actuate `Nope` feedback (series of three weak booms)

            
        case 6:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.prepare()
            generator.impactOccurred()
            AudioServicesPlaySystemSound(1521) // Actuate `Nope` feedback (series of three weak booms)

            
        default:
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
            i = 0
        }
    }
}
