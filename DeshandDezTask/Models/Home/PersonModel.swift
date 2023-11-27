//
//  PersonModel.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 26/11/2023.
//

import Foundation
import UIKit

struct PersonModel : Hashable {
    var name : String?
    var image : String?
    var job : String?
    var isFollowing : Bool?
    var isFavorite : Bool?
                   //      Title    title    background
    var followBtnConfig : (String , UIColor ,UIColor ) {
        return isFollowing ?? false ? ("Unfollow" , .main , .clear) : ("Follow" , .white , .main)
    }
}
