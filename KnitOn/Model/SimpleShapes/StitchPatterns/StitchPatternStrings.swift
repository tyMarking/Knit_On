//
//  StitchPatternStrings.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/19/17.
//  Copyright © 2017 Knit On. All rights reserved.
//
// This file contains the static instruction strings for any of the stitch patterns.
// The strings use Format Specifiers for adding dynamic values when generating instructions

import Foundation

struct StitchPatternStrings {
    
    struct OneByOneRib {
        static let rows: String = "Row 1: [Knit 1, Purl 1] repeat until end of row.\rRepeat Row 1 until desired length."
        static let round: String = "Round 1: [Knit 1, Purl 1] repeat until end of round.\rRepeat Round 1 for 1 by 1 rib."
    }
    
    struct TwoByTwoRib {
        static let rows: String = "Row 1: [Knit 2, Purl 2] repeat until end of row.\rRepeat Row 1 until desired length."
        static let round: String = "Round 1: [Knit 2, Purl 2] repeat until end of round.\rRepeat Round 1 for 2 by 2 rib."
    }
    
    struct ThreeOverThreeDoubleCable {
        static let round: String =
            "16 stitch panel\r" +
            "Rounds 1-4: P2, K12, P2\r" +
            "Round 5: P2, slip 3 stitches onto cable needle and hold in front, K3, K3 from cable needle, slip 3 stitches " +
            "onto cable needle and hold in back, K3, K3 from cable needle, P2\r" +
            "Round 6: P2, K12, P2\r" +
            "Repeat Rounds 1-6 for 3 over 3 double cable"
        static let rows: String = "Need to write instructions of 3 over 3 double cable in rows"
        
    }
    
    
}
