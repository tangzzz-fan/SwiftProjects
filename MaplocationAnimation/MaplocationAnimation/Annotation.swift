//
//  Annotation.swift
//  MaplocationAnimation
//
//  Created by MacPro on 03/07/2018.
//  Copyright © 2018 Centaline. All rights reserved.
//

import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    // MARK: - Initializers
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
