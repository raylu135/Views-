//
//  ViewController.swift
//  Views2
//
//  Created by raylu on 21/02/2019.
//  Copyright © 2019 raylu. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.isHidden = true
        view2.isHidden = true
        
        
        let endEditingTapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        endEditingTapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(endEditingTapGesture)
            
        }
    
  
        
    @IBAction func button1(_ sender: Any) {
        if textField1.text != nil {
            label1.text = textField1.text
        } else {
            label1.text = nil
        }
        
    }
    
    @IBAction func button2(_ sender: Any) {
        if textField2.text != nil{
            label2.text = textField2.text
        } else {
            label2.text = nil
        }
    }

    @IBAction func showView(_ sender: Any) {
        view1.isHidden = false
        view2.isHidden = false
        
    }
    
    @IBAction func hideView(_ sender: Any) {
        view1.isHidden = true
        view2.isHidden = true
    }
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    @IBAction func handlePinch(recognizer:UIPinchGestureRecognizer){
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    

}

