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
        print("DEBUG:: canon Pressed")
    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
        print("DEBUG:: forwardTank Pressed")

    }
    
    @IBAction func rightButtonTankPressed(_ sender: Any) {
        print("DEBUG:: rightTank Pressed")

    }
    
    @IBAction func rightButtonCanonPressed(_ sender: Any) {
        print("DEBUG:: rightCanon Pressed")

    }
    
    @IBAction func leftButtonCanonPressed(_ sender: Any) {
        print("DEBUG:: leftCanon Pressed")

    }
    
    @IBAction func leftButtonTankPressed(_ sender: Any) {
        print("DEBUG:: leftTank Pressed")

    }
    
    
    // MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureARExperience()
    }
    
    // MARK: - Helper Functions
    func configureARExperience() {
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        arView.scene.anchors.append(tankAnchor!)
    }
}
