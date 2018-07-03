//
//  Entry.swift
//  01NavigationAnimation
//
//  Created by MacPro on 03/07/2018.
//  Copyright © 2018 Centaline. All rights reserved.
//

import UIKit

class Entry: NSObject {
    // MARK: - Properties
    // 定义使用的常量属性
    let title: String
    let image: UIImage
    
    // MARK: - Initializers
    
    // 提供默认的初始化方法 调用时 没有 init 出现
    init(title: String, image: UIImage) {
        self.title = title
        self.image = image
    }
}
