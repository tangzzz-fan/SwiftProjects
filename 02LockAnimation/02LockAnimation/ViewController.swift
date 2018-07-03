//
//  ViewController.swift
//  02LockAnimation
//
//  Created by MacPro on 03/07/2018.
//  Copyright © 2018 Centaline. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLock: UIImageView!
    @IBOutlet weak var bottomLock: UIImageView!
    @IBOutlet weak var lockBoder: UIImageView!
    @IBOutlet weak var lockKeyhole: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        openLock()
    }
    
    // 开锁, 执行动画 1 锁孔旋转 2 上下回退
    func openLock() {
        UIView.animateKeyframes(withDuration: 0.4, delay: 3.0, options: [], animations: {
            
            // 旋转
            self.lockKeyhole.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 0.5))
            
        }, completion: { (_) in
            // 上下回退
            UIView.animate(withDuration: 0.5, delay: 0.4, options: [], animations: {
                // 开锁
                let yDelta = self.lockBoder.frame.maxY
                self.topLock.center.y -= yDelta
                self.lockKeyhole.center.y -= yDelta
                self.lockBoder.center.y -= yDelta
                self.bottomLock.center.y += yDelta
                
            }, completion: { (_) in
                // 动作完成 移除视图
                self.topLock.removeFromSuperview()
                self.lockKeyhole.removeFromSuperview()
                self.lockBoder.removeFromSuperview()
                self.bottomLock.removeFromSuperview()
            })
        })
    }


}

