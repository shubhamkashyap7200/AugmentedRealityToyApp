//
//  ViewController.swift
//  TankApp
//
//  Created by Shubham on 12/24/22.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var arView: ARView!
    var tankAnchor: TinyToyTank._TinyToyTank?
    
    // MARK: - Actions
    @IBAction func canonShotPressed(_ sender: Any) {
        tankAnchor?.notifications.cannonFire.post()
    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
        tankAnchor?.notifications.tankForward.post()
    }
    
    @IBAction func rightButtonTankPressed(_ sender: Any) {
        tankAnchor?.notifications.tankRight.post()

    }
    
    @IBAction func rightButtonCanonPressed(_ sender: Any) {
        tankAnchor?.notifications.turretRight.post()

    }
    
    @IBAction func leftButtonCanonPressed(_ sender: Any) {
        tankAnchor?.notifications.turretLeft.post()

    }
    
    @IBAction func leftButtonTankPressed(_ sender: Any) {
        tankAnchor?.notifications.tankLeft.post()

    }
    
    
    // MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureARExperience()
    }
    
    // MARK: - Helper Functions
    func configureARExperience() {
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        tankAnchor?.cannon?.setParent(tankAnchor?.tank, preservingWorldTransform: true)
        arView.scene.anchors.append(tankAnchor!)
    }
}
