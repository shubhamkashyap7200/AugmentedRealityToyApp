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
