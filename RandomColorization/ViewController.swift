//
//  ViewController.swift
//  RandomColorization
//
//  Created by ws on 2016/10/8.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var gradientLayer = CAGradientLayer()
    var timer: NSTimer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func playBtnChick(sender: AnyObject) {
        
        
        do{
            let musicUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ecstasy", ofType: "mp3")!)
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOfURL: musicUrl)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
        }catch let audioError as NSError{
            
            print(audioError)
        }
        
        if timer == nil {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(ViewController.randomColor), userInfo: nil, repeats: true)
        }
        
        
        //graditent color
        gradientLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).CGColor as CGColorRef
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).CGColor as CGColorRef
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).CGColor as CGColorRef
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).CGColor as CGColorRef
        let color5 = UIColor(white: 0.4, alpha: 0.2).CGColor as CGColorRef
        
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientLayer.startPoint = CGPointMake(0, 0)
        gradientLayer.endPoint = CGPointMake(1, 1)
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    func randomColor (){
        
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }

}
