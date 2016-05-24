//
//  CGSize-Extenstion.swift
//  SwiftCommon
//
//  Created by Andrew Bradnan on 5/23/16.
//  Copyright © 2016 Belkin. All rights reserved.
//

import Foundation

extension CGSize {
    public func swap() -> CGSize {
        return CGSizeMake(self.height, self.width)
    }
}
