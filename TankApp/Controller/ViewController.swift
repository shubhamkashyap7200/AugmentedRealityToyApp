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
    // 1
    var tankAnchor: TinyToyTank._TinyToyTank?
    var isActionPlaying: Bool = false
    
    // 2
    @IBOutlet var arView: ARView!
    
    // MARK: - Actions
    @IBAction func canonShotPressed(_ sender: Any) {
        if self.isActionPlaying {
            return
        }
        else {
            self.isActionPlaying = true
        }
        
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
        tankAnchor?.actions.actionComplete.onAction = { _ in
            self.isActionPlaying = false
        }
        arView.scene.anchors.append(tankAnchor!)
    }
}
