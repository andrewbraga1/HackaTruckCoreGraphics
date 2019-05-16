//
//  ViewController.swift
//  graphics
//
//  Created by student on 16/05/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func draw(_ sender: UIButton) {
        
        drawView.drawShape(selectedShape:.rectangle)
        
    }

}

