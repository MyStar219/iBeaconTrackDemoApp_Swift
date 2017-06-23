//
//  TrackViewController.swift
//  iBeaconTrackDemoApp
//
//  Created by Jin Jin on 6/24/17.
//  Copyright © 2017 Jin Jin. All rights reserved.
//

import UIKit
import CoreLocation
class TrackViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var iBeaconFoundLabel: UILabel!
    @IBOutlet weak var proximityUUIDLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var minorLabel: UILabel!
    @IBOutlet weak var accuracyLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var rssiLabel: UILabel!
    var locationManager : CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        startScanningForBeaconRegion(beaconRegion: getBeaconRegion())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        let beacon = beacons.last
        
        if beacons.count > 0 {
            iBeaconFoundLabel.text = "Yes"
            proximityUUIDLabel.text = beacon?.proximityUUID.uuidString
            majorLabel.text = beacon?.major.stringValue
            minorLabel.text = beacon?.minor.stringValue
            accuracyLabel.text = String(describing: beacon?.accuracy)
            if beacon?.proximity == CLProximity.unknown {
                distanceLabel.text = "Unknown Proximity"
            } else if beacon?.proximity == CLProximity.immediate {
                distanceLabel.text = "Immediate Proximity"
            } else if beacon?.proximity == CLProximity.near {
                distanceLabel.text = "Near Proximity"
            } else if beacon?.proximity == CLProximity.far {
                distanceLabel.text = "Far Proximity"
            }
            rssiLabel.text = String(describing: beacon?.rssi)
        } else {
            iBeaconFoundLabel.text = "No"
            proximityUUIDLabel.text = ""
            majorLabel.text = ""
            minorLabel.text = ""
            accuracyLabel.text = ""
            distanceLabel.text = ""
            rssiLabel.text = ""
        }
        
        print("Ranging")
    }
    func getBeaconRegion() -> CLBeaconRegion {
        let beaconRegion = CLBeaconRegion.init(proximityUUID: UUID.init(uuidString: "E06F95E4-FCFC-42C6-B4F8-F6BAE87EA1A0")!,
                                               identifier: "com.devfright.myRegion")
        return beaconRegion
    }
    func startScanningForBeaconRegion(beaconRegion: CLBeaconRegion) {
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
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
