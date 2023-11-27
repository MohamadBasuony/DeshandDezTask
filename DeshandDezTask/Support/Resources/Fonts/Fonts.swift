// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI

extension Font {
  public static func ibmPlexSansArabic(_ style: IBMPlexSansArabicStyle, fixedSize: CGFloat) -> Font {
    return Font.custom(style.rawValue, fixedSize: fixedSize)
  }

  public static func ibmPlexSansArabic(_ style: IBMPlexSansArabicStyle, size: CGFloat, relativeTo textStyle: TextStyle = .body) -> Font {
    return Font.custom(style.rawValue, size: size, relativeTo: textStyle)
  }

  public enum IBMPlexSansArabicStyle: String {
    case bold = "IBMPlexSansArabic-Bold"
    case extraLight = "IBMPlexSansArabic-ExtraLight"
    case light = "IBMPlexSansArabic-Light"
    case medium = "IBMPlexSansArabic-Medium"
    case regular = "IBMPlexSansArabic-Regular"
    case semiBold = "IBMPlexSansArabic-SemiBold"
    case thin = "IBMPlexSansArabic-Thin"
  }
}

extension Font {
  public static func poppins(_ style: PoppinsStyle, fixedSize: CGFloat) -> Font {
    return Font.custom(style.rawValue, fixedSize: fixedSize)
  }

  public static func poppins(_ style: PoppinsStyle, size: CGFloat, relativeTo textStyle: TextStyle = .body) -> Font {
    return Font.custom(style.rawValue, size: size, relativeTo: textStyle)
  }

  public enum PoppinsStyle: String {
    case black = "Poppins-Black"
    case blackItalic = "Poppins-BlackItalic"
    case bold = "Poppins-Bold"
    case boldItalic = "Poppins-BoldItalic"
    case extraBold = "Poppins-ExtraBold"
    case extraBoldItalic = "Poppins-ExtraBoldItalic"
    case extraLight = "Poppins-ExtraLight"
    case extraLightItalic = "Poppins-ExtraLightItalic"
    case italic = "Poppins-Italic"
    case light = "Poppins-Light"
    case lightItalic = "Poppins-LightItalic"
    case medium = "Poppins-Medium"
    case mediumItalic = "Poppins-MediumItalic"
    case regular = "Poppins-Regular"
    case semiBold = "Poppins-SemiBold"
    case semiBoldItalic = "Poppins-SemiBoldItalic"
    case thin = "Poppins-Thin"
    case thinItalic = "Poppins-ThinItalic"
  }
}
