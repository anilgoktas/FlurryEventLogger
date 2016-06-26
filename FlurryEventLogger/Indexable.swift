//
//  Indexable.swift
//  Dizi Takip 2
//
//  Created by Anıl Göktaş on 1/6/16.
//  Copyright © 2016 Anıl Göktaş. All rights reserved.
//

import Foundation

extension Indexable {
    
    subscript(safeIndex safeIndex: Index) -> _Element? {
        return safeIndex.distanceTo(endIndex) > 0 ? self[safeIndex] : nil
    }
    
}