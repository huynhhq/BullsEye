//
//  ViewController.swift
//  FirstApp
//
//  Created by huynhhq on 1/24/19.
//  Copyright © 2019 huynhhq. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var audioPlayerApp = AVAudioPlayer()
    var appData: AppData? = nil
    var leftInset: CGFloat = 0.0
    var rightInset: CGFloat = 0.0
    
    //Collection View
    @IBOutlet weak var consecutiveTimesCV: UICollectionView!
    
    //Title: Score
    @IBOutlet weak var scoreTitle: UIPaddedLabel!
    
    //Image: Background Image
    @IBOutlet weak var backgroundImage: UIImageView!
    
    //Buttons
    @IBOutlet weak var btnStartOver: UIPaddedButton!
    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var btnHitMe: UIPaddedButton!
    
    //Sliders Element
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var numb100Lb: UIPaddedLabel!
    @IBOutlet weak var numbOneLb: UIPaddedLabel!
    
    //Title: Game title
    @IBOutlet weak var gameTitle: UIPaddedLabel!
    
    //Title: round
    @IBOutlet weak var roundLabel: UIPaddedLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(soundName: Constants.kBaseMusic, isRepeat: true, audioPlayerPart: &audioPlayerApp)
        appData = Utils.getAppData()
        appData!.targetPoint = Utils.randomValue(appData!.sliderValue)
        applyAppData(appData!)
        setupView()
        let consecutiveTimes = Utils.getConsecutiveTimesCurrernt()
        refreshCollectionView(consecutiveTimes!)
    }
    
    @IBAction func touchMe(){
        playSound(soundName: Constants.kCuteLaugh, isRepeat: false, audioPlayerPart: &audioPlayer)
        //calculate mark based on the value that user chose ([Utils.calcPoint] function)
        let result = Utils.calcPoint(data: appData!)
        appData!.score += result.point
        //change challenge point ([Utils.randomValue] function)
        appData!.targetPoint = Utils.randomValue(appData!.sliderValue)
        //count round if success
        if result.isPassedRound {
            appData!.successTime = 0
            appData!.round += 1
            appData!.image = Utils.getImageFromRound(appData!.round)
        }else {
            if result.isSuccess {
                appData!.successTime += 1
            }else{
                appData!.successTime = 0
            }
        }
        //change view
        applyAppData(appData!)
        //store current data in userdefault
        appData?.storeAppData()
        //reset slider
        slider.value = 50
        consecutiveTimesCV.reloadData()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        appData!.sliderValue = Int(slider.value)
    }
    
    @IBAction func resetData(){
        appData = AppData(isFirstOpen: true
            , targetPoint: 0
            , sliderValue: 0
            , round: 1
            , score: 0
            , successTime: 0
            , image: Constants.kDefaultImage)
        appData!.targetPoint = Utils.randomValue(appData!.sliderValue)
        applyAppData(appData!)
        //store current data in userdefault
        appData?.storeAppData()
        //reset slider
        slider.value = 50
    }
    
    func applyAppData(_ appData: AppData) {
        let scoreContent = "\(Constants.kScoreText) \(appData.score)"
        let roundContent = "\(Constants.kRoundText) \(appData.round)"
        scoreTitle.changeContentAndColor(content: scoreContent
            , color: UIColor.blue, targetContent: "\(appData.score)")
        roundLabel.changeContentAndColor(content: roundContent
            , color: UIColor.red, targetContent: "\(appData.round)")
        let gameTilteContent = "\(Constants.kGameTitle) \(appData.targetPoint)"
        gameTitle.changeContentAndColor(content: gameTilteContent
            , color: UIColor.green
            , targetContent: "\(appData.targetPoint)")
        Utils.assignbackground(imageName: appData.image, imageView: backgroundImage)
    }
    
    func setupView() {
        //Labels
        numbOneLb.setBorderRadiusAll()
        numb100Lb.setBorderRadiusAll()
        scoreTitle.setBorderRadiusAll()
        roundLabel.setBorderRadiusAll()
        gameTitle.setBorderRadiusAll()
        //Buttons
        btnHitMe.setTitleColor(UIColor.white, for: .normal)
        btnHitMe.layer.cornerRadius = 8
        btnHitMe.layer.masksToBounds = true
        btnStartOver.layer.cornerRadius = 8
        btnStartOver.layer.masksToBounds = true
        btnHitMe.applyGradient(colors: [UIColor.yellow.cgColor, UIColor.green.cgColor])
        btnHitMe.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        //Scroll View
        consecutiveTimesCV.layer.cornerRadius = 15
        consecutiveTimesCV.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        consecutiveTimesCV.collectionViewLayout.invalidateLayout()
    }
    
    func playSound(soundName: String, isRepeat: Bool, audioPlayerPart: inout AVAudioPlayer){
        do {
            let soundSource = URL(fileURLWithPath: Bundle.main.path(forResource: soundName, ofType: "mp3")!)
            
            audioPlayerPart = try AVAudioPlayer(contentsOf: soundSource)
            audioPlayerPart.prepareToPlay()
            audioPlayerPart.numberOfLoops = (isRepeat == true) ? -1 : 0
            audioPlayerPart.play()
        } catch {
            print(error)
            fatalError(error as! String)
        }
    }
    
    func refreshCollectionView(_ count: Int) {
        let collectionViewHeight = consecutiveTimesCV.bounds.height
        let collectionViewWidth = consecutiveTimesCV.bounds.width
        let numberOfItemsThatCanInCollectionView = Int(collectionViewWidth / collectionViewHeight)
        if numberOfItemsThatCanInCollectionView > count {
            let totalCellWidth = collectionViewHeight * CGFloat(count)
            let totalSpacingWidth: CGFloat = CGFloat(count) * (CGFloat(count) - 1)
            // leftInset, rightInset are the global variables which I am passing to the below function
            leftInset = (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2;
            rightInset = -leftInset
        } else {
            leftInset = 0.0
            rightInset = -collectionViewHeight
        }
        consecutiveTimesCV.reloadData()
    }

}

