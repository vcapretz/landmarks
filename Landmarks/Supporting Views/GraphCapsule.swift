//
//  GraphCapsule.swift
//  Landmarks
//
//  Created by Vitor Capretz on 2019-07-25.
//  Copyright © 2019 Vitor Capretz. All rights reserved.
//

import SwiftUI

struct GraphCapsule: View {
    var index: Int
    var height: Length
    var range: Range<Double>
    var overallRange: Range<Double>
    
    var heightRadio: Length {
        max(Length(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }
    
    var offsetRatio: Length {
        Length((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }
    
    var body: some View {
        Capsule()
            .fill(Color.white)
            .frame(height: height * heightRadio, alignment: .bottom)
            .offset(x: 0, y: height * -offsetRatio)
    }
}

#if DEBUG
struct GraphCapsule_Previews: PreviewProvider {
    static var previews: some View {
        GraphCapsule(index: 0, height: 150, range: 10..<50, overallRange: 0..<100)
    }
}
#endif
