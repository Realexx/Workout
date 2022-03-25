//
//  addProfilView.swift
//  Workout
//
//  Created by karim ounis on 04/03/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State var userData : ProfileViewModel
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var birth = Date()
    @State var sexe : Sexe = .female
    
    var body: some View {
        
        VStack{
            TextField("First Name", text: $firstName)
                .padding(.horizontal)
                .frame(height: 55)
                .cornerRadius(10)
            
            TextField("Last Name", text: $lastName)
                .padding(.horizontal)
                .frame(height: 55)
                .cornerRadius(10)
            
            Picker("Sexe", selection: $sexe){
                ForEach(Sexe.allCases, id: \.self){sexe in
                    Text(sexe.rawValue)
                }
                
            }
            .pickerStyle(SegmentedPickerStyle()) // Changement du style
            
            DatePicker("Date of birth",selection: $birth, displayedComponents: [.date])
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal)
                .frame(height: 55)
                .cornerRadius(10)
            
            Button{
                userData.addUser(firstName: firstName, lastName: lastName, sexe: sexe, birth: birth)
                
            } label: {
                Text("Save")
                    .foregroundColor(.blue)
                    .font(.headline)
                
            }
            Spacer()
        }
        .padding(20)
        .navigationTitle("😎 Profil") // emoji : ctrl + cmd + space
    }
}

struct addProfilView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProfileView(userData: ProfileViewModel(), firstName: "", lastName: "", birth: Date(), sexe: .female)
        }
    }
}
