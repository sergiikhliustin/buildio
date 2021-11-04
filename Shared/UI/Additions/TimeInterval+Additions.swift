//
//  TimeInterval+Additions.swift
//  Buildio
//
//  Created by Sergey Khliustin on 04.11.2021.
//

import Foundation

extension TimeInterval {
    func stringFromTimeInterval() -> String {
        let time = Int(self)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)
        
        if hours > 0 {
            return String(format: "%0.2dh %0.2dm %0.2ds", hours, minutes, seconds)
        } else if minutes > 0 {
            return String(format: "%0.2dm %0.2ds", minutes, seconds)
        } else {
            return String(format: "%0.2ds", seconds)
        }
    }
}
