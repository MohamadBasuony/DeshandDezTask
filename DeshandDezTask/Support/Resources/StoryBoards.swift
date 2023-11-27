//
//  StoryBoards.swift
//  Codex-Task
//
//  Created by Mohamad Basuony on 02/11/2023.
//

import Foundation
import UIKit

enum StoryBoards : String{
    case Main
    case Tabbar

    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}
