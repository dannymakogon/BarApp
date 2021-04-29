//
//  AdminLoginScreen.swift
//  Bar Order App
//
//  Created by Danny Makogon on 4/26/21.
//

import SwiftUI

struct AdminLoginScreen: View {
    @StateObject var ViewChanger: viewChanger
    @State private var password = ""
    @State private var adminPassword = "1234"
    @State private var alert = ""
    var body: some View {
        VStack{
            HStack (spacing: 86){
                Button(action: {
                    ViewChanger.currentPage = .LoginScreen
                }, label: {
                Image(systemName: "arrowshape.turn.up.backward")
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
                })
            Text("Bar App")
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.black)
                .padding()
                Spacer()
                
            }
            Text("Admin Sign In")
            Spacer()
            Text(alert)
                .foregroundColor(.red)
            TextField("Password", text: $password)
                .textContentType(.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 325, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.blue)
                .shadow(radius: 8)
                .keyboardType(.numberPad)
                
            Button("Log In", action:{
                if (password == adminPassword){
                    print("Admin Logged In")
                    ViewChanger.currentPage = .AdminScreen
                }
                else{
                    print("Password Incorrect")
                    alert = "Try again"
                }
            })
            .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Capsule().fill(Color.blue))
            .foregroundColor(.white)
            .padding()
            Spacer()
            
        }
    }
}

struct AdminLoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        AdminLoginScreen(ViewChanger: viewChanger())
    }
}
