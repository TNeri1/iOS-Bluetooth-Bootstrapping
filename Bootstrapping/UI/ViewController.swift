//
//  ViewController.swift
//  Bootstrapping
//
//  Created by Trevor Neri on 11/27/21.
//

import UIKit
import CoreBluetooth

/**
 This view attempts to turn on the Bluetooth Radio
 */
class ViewController: UIViewController, CBCentralManagerDelegate {
    
    // MARK: UI Elements
    @IBOutlet weak var bluetoothStatusLabel: UILabel!
    // MARK: Scan Properties
    var centralManager: CBCentralManager!
    
    /**
     View loaded. Start Bluetooth radio.
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Initializing central manager")
        centralManager = CBCentralManager(delegate: self, queue: nil)
        // Do any additional setup after loading the view.
    }
    
    // MARK: CBCentralManagerDelegate Functions
    
    /**
     Bluetooth radio state changed
     
     - Parameters:
     - central: the reference to the central
     */
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("Central Manager updated: checking state")
        
        switch (central.state) {
            
        case .resetting:
            print("BLE Hardware is resetting...")
            bluetoothStatusLabel.text = "Bluetooth Radio Resetting..."
        case .unsupported:
            print("BLE Hardware is unsupported on this device")
            bluetoothStatusLabel.text = "Bluetooth Radio Unsupported"
        case .unauthorized:
            print("BLE State is unauthorized")
            bluetoothStatusLabel.text = "Bluetooth Radio Unauthorized"
        case .poweredOff:
            print("BLE Hardware is powered off")
            bluetoothStatusLabel.text = "Bluetooth Radio Off"
        case .poweredOn:
            print("BLE Hardware powered on and ready")
            bluetoothStatusLabel.text = "Bluetooth Radio On"
        case .unknown:
            print("BLE state is unavailable")
            bluetoothStatusLabel.text = "Bluetooth State Unknown"
        @unknown default:
            print("BLE state is unavailable")
            bluetoothStatusLabel.text = "Bluetooth State Unknown"
        }
    }


}

