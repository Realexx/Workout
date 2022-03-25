//
//  ProfileViewModel.swift
//  Workout
//
//  Created by karim ounis on 04/03/2022.
//

import Foundation

class ProfileViewModel : ObservableObject{
    @Published var users: [User] = []
    
    init(){
        
    }
    
    func addUser(firstName: String, lastName: String,sexe: Sexe, birth: Date){
        let newUser = User(firstName: firstName, lastName: lastName, sexe: sexe, birth: birth)
        users.append(newUser)
        
        print("CREATION USER : ",newUser)
    }
}
