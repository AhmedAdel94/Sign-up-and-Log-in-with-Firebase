//
//  SecondViewController.swift
//  safe app
//
//  Created by Ahmed Adel on 7/22/17.
//  Copyright © 2017 Ahmed Adel. All rights reserved.
//

import UIKit
import FirebaseAuth

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(Auth.auth().currentUser?.email)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Action(_ sender: UIButton) {
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "segue2", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
