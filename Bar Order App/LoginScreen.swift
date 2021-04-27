//
//  LoginScreen.swift
//  Bar Order App
//
//  Created by Danny Makogon on 4/26/21.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject var ViewChanger: viewChanger
    @State private var notSupported = ""
    var body: some View {
        
        //ONE BUTTON
VStack{
   
    Text("Bar App")
        .font(.system(size: 32, weight: .medium, design: .default))
        .foregroundColor(.black)
        .padding()
    Spacer()
    VStack{
        Button("Guest", action: {
            print("Clicked Login As Guest")
            ViewChanger.currentPage = .GuestSignInScreen
        }
        )
        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Capsule().fill(Color.blue))
        .foregroundColor(.white)
        .padding()
        Button("Admin", action: {
            print("Clicked Login as Admin")
            ViewChanger.currentPage = .AdminLoginScreen
        }
        )
        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Capsule().fill(Color.blue))
        .foregroundColor(.white)
        .padding()
        Button(action: {
            print("Clicked Create Account")
            notSupported = "Not yet Supported"
        }, label: {
            HStack{
            Text("Create Account")
                .underline()
            }
        }
        )
        Text(notSupported)
            .foregroundColor(.red)
        
    }
    Spacer()
}
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(ViewChanger: viewChanger())
    }
}
