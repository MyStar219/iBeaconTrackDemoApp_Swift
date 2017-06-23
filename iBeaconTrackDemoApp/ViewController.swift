//
//  ViewController.swift
//  iBeaconTrackDemoApp
//
//  Created by Jin Jin on 6/24/17.
//  Copyright © 2017 Jin Jin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func trackButtonclicked(_ sender: UIButton) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "TrackViewController") as! TrackViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func transmitButtonclicked(_ sender: UIButton) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ConfigViewController") as! ConfigViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

