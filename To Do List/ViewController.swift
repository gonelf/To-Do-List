//
//  ViewController.swift
//  To Do List
//
//  Created by Gonçalo Henriques on 19/12/14.
//  Copyright (c) 2014 Mobigeek Studios. All rights reserved.
//

import UIKit

var toDoItems:[String] = []

class ViewController: UITableViewController{

    @IBOutlet var toDoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        getAllItems()
    }
    
    // MARK: - table fuctions
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoItems[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            toDoItems.removeAtIndex(indexPath.row)
            saveToDoItems()
            toDoListTableView.reloadData()
        }
    }
    
    // MARK: - saved values functions

    func getAllItems () {
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoItems") != nil {
            
            var storedToDoItems: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoItems")!
            toDoItems = []
            
            for (var i = 0; i < storedToDoItems.count; i++) {
                toDoItems.append(storedToDoItems[i] as NSString)
            }
        }
        
        toDoListTableView.reloadData()
    }
    
    // MARK: - segue functions
    
    @IBAction func addNewItem(sender: AnyObject) {
        self.performSegueWithIdentifier("segueNewItem", sender: nil)
    }
}


func saveToDoItems () {
    let fixedToDoItems = toDoItems
    NSUserDefaults.standardUserDefaults().setObject(fixedToDoItems, forKey: "toDoItems")
    NSUserDefaults.standardUserDefaults().synchronize()
}
