//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import UIKit

public struct DeviceRack {
    
    private init() {}
    
    public struct iPhone {
        
        private init() {}
        
        public static let screen3_5 = DeviceInfo(
            portraitScreenSize: CGSize(width: 320.0, height: 480.0),
            name: "iPhone 3,5\"",
            scale: 2.0
        )
        
        public static let screen4_0 = DeviceInfo(
            portraitScreenSize: CGSize(width: 320.0, height: 568.0),
            name: "iPhone 4\"",
            scale: 2.0
        )
        
        public static let screen4_7 = DeviceInfo(
            portraitScreenSize: CGSize(width: 375.0, height: 667.0),
            name: "iPhone 4,7\"",
            scale: 2.0
        )
        
        public static let screen5_5 = DeviceInfo(
            portraitScreenSize: CGSize(width: 414.0, height: 736.0),
            name: "iPhone 5,5\"",
            scale: 3.0
        )

        public static let screen5_8 = DeviceInfo(
            portraitScreenSize: CGSize(width: 375.0, height: 812.0),
            name: "iPhone 5,8\"",
            scale: 3.0
        )

        public static let screen6_1 = DeviceInfo(
            portraitScreenSize: CGSize(width: 414.0, height: 896.0),
            name: "iPhone 6,1\"",
            scale: 2.0
        )

        public static let screen6_5 = DeviceInfo(
            portraitScreenSize: CGSize(width: 414.0, height: 896.0),
            name: "iPhone 6,5\"",
            scale: 3.0
        )
        
        public static let all: [DeviceInfo] = [
            iPhone.screen3_5,
            iPhone.screen4_0,
            iPhone.screen4_7,
            iPhone.screen5_5,
            iPhone.screen5_8,
            iPhone.screen6_1,
            iPhone.screen6_5
        ]
    }
    
    public struct iPad {
        
        private init() {}
        
        public static let nonRetina = DeviceInfo(
            portraitScreenSize: CGSize(width: 768.0, height: 1024.0),
            name: "iPad",
            scale: 1.0
        )

        public static let retina = DeviceInfo(
            portraitScreenSize: CGSize(width: 768.0, height: 1024.0),
            name: "iPad Retina",
            scale: 2.0
        )

        public static let proBig = DeviceInfo(
            portraitScreenSize: CGSize(width: 1024.0, height: 1366.0),
            name: "iPad Pro Big",
            scale: 2.0
        )

        public static let proSmall = DeviceInfo(
            portraitScreenSize: CGSize(width: 834.0, height: 1112.0),
            name: "iPad Pro Small",
            scale: 2.0
        )
        
        public static let all: [DeviceInfo] = [
            iPad.nonRetina,
            iPad.retina,
            iPad.proBig,
            iPad.proSmall
        ]
    }
}
