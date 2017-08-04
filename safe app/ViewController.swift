//
//  ViewController.swift
//  safe app
//
//  Created by Ahmed Adel on 7/22/17.
//  Copyright © 2017 Ahmed Adel. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBOutlet var segmentControl: UISegmentedControl!
    
    @IBOutlet var actionButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    @IBAction func action(_ sender: UIButton) {
        if email.text != "" && password.text != ""{
            if segmentControl.selectedSegmentIndex == 0 // Login
            {
               
                
                Auth.auth().signIn(withEmail: email.text!, password: password.text!,completion:{ (user,error) in
                    if user != nil
                    {
                        // Succesful sign in
                        //print("You signed in successfully")
                        
                        self.performSegue(withIdentifier: "segue", sender: self)
                    }
                    else
                    {
                        if let myerror = error?.localizedDescription
                        {
                            print(myerror)
                        }
                        else
                        {
                            print("Error")
                        }
                        
                    }
                })
            }
            else // Sign up
            {
                Auth.auth().createUser(withEmail:email.text!,password:password.text!, completion:{ (user,error) in
                    if user != nil
                    {
                       // print("You signed up successfully")
                    self.performSegue(withIdentifier: "segue", sender: self)

                    }
                    else
                    {
                        if let myerror = error?.localizedDescription
                        {
                            print(myerror)
                        }
                        else
                        {
                            print("Error")
                        }
                    }
                    
                })
            }
        }
    }
    
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        print(segmentControl.selectedSegmentIndex)
        
        if segmentControl.selectedSegmentIndex == 0{
            actionButton.setTitle("Sign In", for: .normal)
        }else if segmentControl.selectedSegmentIndex == 1{
            actionButton.setTitle("Sign Up", for: .normal)
        }
    }


}

