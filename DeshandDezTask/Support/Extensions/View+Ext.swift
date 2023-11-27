//
//  File.swift
//  REFD-Customer
//
//  Created by Mohamad Basuony on 07/08/2023.
//

import Foundation
import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }

    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
         NavigationView {
             ZStack {
                 self
                     .navigationBarTitle("")
                     .navigationBarHidden(true)

                 NavigationLink(
                     destination: view
                         .navigationBarTitle("")
                         .navigationBarHidden(true),
                     isActive: binding
                 ) {
                     EmptyView()
                 }
             }
         }
         .navigationViewStyle(.stack)
     }
}

extension View {
    func createBorder(cornerRadius : CGFloat ,inset : Double , color : Color , width : CGFloat) -> some View {
        return overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .inset(by: inset)
                .stroke(color, lineWidth: width)
        )
    }
}

func ??<T> (lhs: Binding<T?> ,rhs: T ) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}

extension View {
    /// 隐藏 List 中的 分割线
    func hideRowSeparator(insets: EdgeInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0),
                          background: Color = .white) -> some View {
        modifier(HideRowSeparatorModifier(insets: insets, background: background))
    }
}

struct HideRowSeparatorModifier: ViewModifier {

  static let defaultListRowHeight: CGFloat = 44

  var insets: EdgeInsets
  var background: Color

  init(insets: EdgeInsets, background: Color) {
    self.insets = insets

    var alpha: CGFloat = 0
    if #available(iOS 14.0, *) {
        UIColor(background).getWhite(nil, alpha: &alpha)
        assert(alpha == 1, "Setting background to a non-opaque color will result in separators remaining visible.")
    }
    self.background = background
  }

  func body(content: Content) -> some View {
    content
        .padding(insets)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: Self.defaultListRowHeight)
        .listRowInsets(EdgeInsets())
        .overlay(
            VStack {
                HStack {}
                .frame(maxWidth: .infinity)
                .frame(height: 1)
                .background(background)
                Spacer()
                HStack {}
                .frame(maxWidth: .infinity)
                .frame(height: 1)
                .background(background)
            }
            .padding(.top, -1)
        )
  }
}

struct ListRowSeperatorModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content.listRowSeparator(.hidden)
        } else {
            content.onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            .onDisappear {
                UITableView.appearance().separatorStyle = .singleLine
            }
        }
    }
}

extension View {
    func hideListRowSeparator() -> some View {
        return  self.modifier(ListRowSeperatorModifier())
    }
}

extension View {
    func createProgressView(isShowing : Bool) -> some View {
        if isShowing {
            return AnyView(overlay {
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.5))
                    .edgesIgnoringSafeArea(.all)
//                LineScalePulseOut()
                    .frame(width: 100 ,height: 100)
                    .foregroundColor(.white)})
        } else {
            return AnyView(EmptyView())
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
