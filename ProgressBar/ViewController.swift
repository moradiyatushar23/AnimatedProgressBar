//
//  ViewController.swift
//  ProgressBar
//
//  Created by mac on 29/07/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class progressCell : UITableViewCell {
    
    @IBOutlet weak var viewTrack: UIView!
    @IBOutlet weak var viewMain: UIView!
    
    var viewPr = UIView()
    var animator: UIViewPropertyAnimator!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureProgressView() {
        viewTrack.frame.size.width = UIScreen.main.bounds.size.width - 40
        viewPr.frame = CGRect(x: 20, y: 0, width: 0, height: 4)
        viewPr.backgroundColor = UIColor(red: 59.0/255.0, green: 187.0/255.0, blue: 94.0/255.0, alpha: 1.0)
        viewPr.layer.cornerRadius = viewPr.frame.size.height/2
        viewPr.center = CGPoint(x: viewTrack.frame.origin.x, y: viewTrack.frame.origin.y)
        self.viewMain.addSubview(viewPr)
    }

    
    func animateProgress(duration: CGFloat, progressValue: CGFloat) {
        if !(0 < progressValue || progressValue < 1.0) {
            return
        }
        configureProgressView()
        let timing: UICubicTimingParameters = UICubicTimingParameters(animationCurve: .easeInOut)
        animator = UIViewPropertyAnimator(duration: TimeInterval(duration), timingParameters: timing)
        animator.addAnimations {
            self.viewPr.frame.size.width += self.viewTrack.frame.size.width * progressValue
        }
        animator.startAnimation()
        
    }
}

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath) as? progressCell{
            cell.animateProgress(duration: 0.5, progressValue: 0.5)
            
            return cell
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}

