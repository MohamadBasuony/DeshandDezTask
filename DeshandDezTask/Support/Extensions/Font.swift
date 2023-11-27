//
//  Font.swift
//  REFD-Customer
//
//  Created by Mohamad Basuony on 12/09/2023.
//

import Foundation
import SwiftUI

enum FontStyle {
    case bold
    case extraLight
    case light
    case medium
    case regular
    case semiBold
    case thin

}

extension Font {
    static func localizedFont(fontStyle : FontStyle , size : CGFloat) -> Font {
        if LocalizationManager.sharedInstance.isArabicLanguage() {
            switch fontStyle {
            case .bold:
               return Font.ibmPlexSansArabic(.bold, fixedSize: size)
            case .extraLight:
                return Font.ibmPlexSansArabic(.extraLight, fixedSize: size)
            case .light:
                return Font.ibmPlexSansArabic(.light, fixedSize: size)
            case .medium:
                return Font.ibmPlexSansArabic(.medium, fixedSize: size)
            case .regular:
                return Font.ibmPlexSansArabic(.regular, fixedSize: size)
            case .semiBold:
                return Font.ibmPlexSansArabic(.semiBold, fixedSize: size)
            case .thin:
                return Font.ibmPlexSansArabic(.thin, fixedSize: size)
            }
        } else {
            switch fontStyle {
            case .bold:
               return Font.poppins(.bold, fixedSize: size)
            case .extraLight:
                return Font.poppins(.extraLight, fixedSize: size)
            case .light:
                return Font.poppins(.light, fixedSize: size)
            case .medium:
                return Font.poppins(.medium, fixedSize: size)
            case .regular:
                return Font.poppins(.regular, fixedSize: size)
            case .semiBold:
                return Font.poppins(.semiBold, fixedSize: size)
            case .thin:
                return Font.poppins(.thin, fixedSize: size)
            }
        }
    }
}
