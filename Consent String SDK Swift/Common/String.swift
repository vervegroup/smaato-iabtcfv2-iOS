//
//  String.swift
//  gdprConsentStringSwift
//
//  Created by Daniel Kanaan on 4/17/18.
//  Copyright © 2018 Daniel Kanaan. All rights reserved.
//

import Foundation

extension String {
    
    var base64Padded:String {
        get {
            return self.padding(toLength: (self.utf16.count + (4 - (self.utf16.count % 4))),withPad: "=",startingAt: 0)
        }
    }

    
}
