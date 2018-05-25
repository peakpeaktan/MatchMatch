//
//  Level.swift
//  MatchMatch
//
//  Created by zhifeng on 5/24/18.
//  Copyright © 2018 Zhifeng. All rights reserved.
//

import Foundation

enum Level: Int{
    
    case level1 = 0
    case level2
    case level3
    
    func word() -> String{
        
        switch self {
        case .level1:
            return Constants.lvl1Word
        default:
            return ""
        }
    }
}
