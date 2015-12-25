//
//  ViewController.swift
//  Stop watch
//
//  Created by 迫 佑樹 on 2015/12/25.
//  Copyright © 2015年 迫 佑樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var patioPic: UIImageView!
    
    var time = 300
    
    let patio = UIImage(named: "patio.png")
    
    let patio2 = UIImage(named: "patio2.png")
    
    var timer = NSTimer()
    
    var flag = true
    
    func increaseTimer(){
        time--
        let min = time / 60
        let sec = NSString(format: "%02d", time % 60)
        
        timeLabel.text = "\(min):\(sec)"
        
        patioPic.image = patio
        
        let rate = Double(time) / 300
        
        patioPic.transform = CGAffineTransformMakeScale(CGFloat(rate), CGFloat(rate))
        
        
        if time == 0 {
            timer.invalidate()
            timeLabel.text = "LT終了です!!"
            patioPic.transform = CGAffineTransformMakeScale(CGFloat(1), CGFloat(1))

            patioPic.image = patio2
        }
        
    }
    
    @IBAction func play(sender: AnyObject) {
        if flag == true {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("increaseTimer"), userInfo: nil, repeats: true)
            flag = false
        }
        
    }
    @IBAction func pause(sender: AnyObject) {
        
        timer.invalidate()
        flag = true
    }
    @IBAction func stop(sender: AnyObject) {
        
        timer.invalidate()
        
        time = 300
        
        flag = true
        
        timeLabel.text = "5:00"
    }
    @IBOutlet var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

