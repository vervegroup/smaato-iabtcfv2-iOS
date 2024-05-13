//
//  String.h
//  ConsentStringSDKSwift
//
//  Created by Ashwinee Mhaske on 10/05/24.
//  Copyright © 2024 Smaato Inc. All rights reserved.
//

import Foundation

extension String {
    
    var base64Padded:String {
        get {
            return self.padding(toLength: (self.utf16.count + (4 - (self.utf16.count % 4))),withPad: "=",startingAt: 0)
        }
    }

    
}
