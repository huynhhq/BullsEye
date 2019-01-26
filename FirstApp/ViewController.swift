//
//  ViewController.swift
//  FirstApp
//
//  Created by huynhhq on 1/24/19.
//  Copyright © 2019 huynhhq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var appData: AppData? = nil
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetNumber: UILabel!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appData = Utils.getAppData()
        appData!.targetPoint = Utils.randomValue(appData!.sliderValue)
        applyAppData(appData)
        assignbackground()
    }
    
    @IBAction func touchMe(){
        //calculate mark based on the value that user chose ([Utils.calcPoint] function)
        appData!.score += Utils.calcPoint(data: appData!)
        //change challenge point ([Utils.randomValue] function)
        appData!.targetPoint = Utils.randomValue(appData!.sliderValue)
        //count round
        appData!.round += 1
        //change view
        applyAppData(appData)
        //store current data in userdefault
        appData?.storeAppData()
        //reset slider
        slider.value = 50
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        appData!.sliderValue = Int(slider.value)
        //print("sliders: \(slider.value)")
    }
    
    func applyAppData(_ appData: AppData?) {
        scoreLabel.text = NSString(format: "%i", appData!.score) as String
        targetNumber.text = NSString(format: "%i", appData!.targetPoint) as String
        round.text = NSString(format: "%i", appData!.round) as String
    }
   
    func assignbackground(){
        let background = UIImage(named: "15.jpg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}

