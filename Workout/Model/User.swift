//
//  Workout.swift
//  Workout
//
//  Created by karim ounis on 04/03/2022.
//

import Foundation

enum Sexe: String, CaseIterable{
    case female
    case male
    case other
}

struct User : Identifiable{
    var id = UUID()
    
    var firstName: String
    var lastName : String
    var sexe : Sexe
    var birth : Date
    
    //static var userData = []
}

