//
//  addNewItemViewController.swift
//  To Do List
//
//  Created by Gonçalo Henriques on 20/12/14.
//  Copyright (c) 2014 Mobigeek Studios. All rights reserved.
//

import UIKit

class addNewItemViewController:UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var newItem: UITextField!
    
    @IBAction func addItem(sender: AnyObject!) {
        toDoItems.append(newItem.text)
        
        newItem.text = ""
        
        saveToDoItems()
        self.view.endEditing(true)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        addItem(nil)
        return true
    }
}
