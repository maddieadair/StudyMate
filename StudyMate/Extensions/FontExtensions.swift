//
//  FontExtensions.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/14/24.
//

import SwiftUI

extension Font {
    static func averia(_ font: Averia, relativeTo style: Font.TextStyle) -> Font {
        custom(font.rawValue, size: style.size, relativeTo: style)
    }
}

extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 34
        case .title: return 28
        case .title2: return 22
        case .title3: return 20
        case .headline: return 18
        case .body: return 17
        case .callout: return 16
        case .subheadline: return 15
        case .footnote: return 13
        case .caption: return 12
        case .caption2: return 11
        @unknown default:
            return 8
        }
    }
}

enum Averia: String {
    case light = "AveriaSerifLibre-Light"
    case lightItalic = "AveriaSerifLibre-LightItalic"
    case regular = "AveriaSerifLibre-Regular"
    case italic = "AveriaSerifLibre-Italic"
    case bold = "AveriaSerifLibre-Bold"
    case boldItalic = "AveriaSerifLibre-BoldItalic"
    case gruesa = "AveriaGruesaLibre-Regular"
}
