//
//  ViewController.swift
//  ImageViewer
//
//  Created by jinny on 2016. 9. 27..
//  Copyright © 2016년 Jinny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageNames = [ "01.png", "02.png", "03.png", "04.png", "05.png", "06.png" ]
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.image = UIImage(named: imageNames[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPrev(sender: UIButton) {
    }
    
    @IBAction func btnNext(sender: UIButton) {
    }
}

