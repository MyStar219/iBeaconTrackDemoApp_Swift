//
//  ConfigViewController.swift
//  iBeaconTrackDemoApp
//
//  Created by Jin Jin on 6/24/17.
//  Copyright © 2017 Jin Jin. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class ConfigViewController: UIViewController, CBPeripheralManagerDelegate{
    @IBOutlet weak var uuidLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var minorLabel: UILabel!
    @IBOutlet weak var identityLabel: UILabel!
    
    var beaconRegion : CLBeaconRegion!
    var beaconPeripheralData : NSDictionary!
    var peripheralManager : CBPeripheralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBeaconRegion()
        setLabels()

        // Do any additional setup after loading the view.
    }

    @IBAction func transmitButtonTapped(_ sender: UIButton) {
        beaconPeripheralData = beaconRegion .peripheralData(withMeasuredPower: nil)
        peripheralManager = CBPeripheralManager.init(delegate: self, queue: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if (peripheral.state == .poweredOn) {
            peripheralManager .startAdvertising(beaconPeripheralData as? [String : Any])
            print("Powered On")
        } else {
            peripheralManager .stopAdvertising()
            print("Not Powered On, or some other error")
        }
    }
    func initBeaconRegion() {
        beaconRegion = CLBeaconRegion.init(proximityUUID: UUID.init(uuidString: "E06F95E4-FCFC-42C6-B4F8-F6BAE87EA1A0")!,
                                           major: 1233,
                                           minor: 45,
                                           identifier: "com.devfright.myRegion")
    }
    func setLabels() {
        uuidLabel.text = beaconRegion.proximityUUID.uuidString
        majorLabel.text = beaconRegion.major?.stringValue
        minorLabel.text = beaconRegion.minor?.stringValue
        identityLabel.text = beaconRegion.identifier
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
