//
//  CustomTabBarShape.swift
//  Habito
//
//  Created by Saul on 2/13/25.
//

import SwiftUI

struct CustomTabBarShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()

        path.move(to: .init(x: 0, y: rect.height))
        path.addLine(to: .init(x: 0, y: 0))
        path.addLine(to: .init(x: rect.width/3, y:0))

        path.addLine(to: .init(x: rect.width/3, y: 0))
        path.addArc(withCenter: .init(x: rect.width/3 + 7, y: 10), radius: 10, startAngle: -CGFloat.pi/2, endAngle: 0, clockwise: true)
        path.addArc(withCenter: .init(x: 202, y: -25), radius: 60, startAngle: -(7 * CGFloat.pi) / 6, endAngle: -(11 * CGFloat.pi) / 6, clockwise: false)

        path.addArc(withCenter: .init(x: 263, y: 10), radius: 10, startAngle: CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)

        path.addArc(withCenter: .init(x: rect.width, y: 0), radius: 0, startAngle: -CGFloat.pi/2, endAngle: 0, clockwise: true)
        path.addLine(to: .init(x: rect.width, y: rect.height))
        
        path.close()

        return Path(path.cgPath)
    }
}

