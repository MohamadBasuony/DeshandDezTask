//
//  PAge.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 26/11/2023.
//

import Foundation
import Combine

typealias PageListener = PassthroughSubject<Page, Never>

struct Page: Equatable, Hashable {
    let pageIndex: Int
    let sectionIndex: Int
}
