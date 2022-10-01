//
//  ViewController.swift
//  Face ID App
//
//  Created by Mahmut Şenbek on 1.10.2022.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedButton(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Face ID testing") { success, error in
                if success == true {
                    
                    DispatchQueue.main.sync {
                        print("success")
                        self.labelText.text = "success"
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                }else {
                    DispatchQueue.main.sync {
                        self.labelText.text = "Error!"
                    }
                }
            }
        }
            
    }
    
}

