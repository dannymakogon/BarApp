//
//  GuestSignInScreen.swift
//  Bar Order App
//
//  Created by Danny Makogon on 4/26/21.
//
import Combine
import SwiftUI

struct GuestSignInScreen: View {
    @StateObject var user: User
    @StateObject var ViewChanger: viewChanger
    @State private var username = ""
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
            Text("Guest Sign In")
            Spacer()
            Text(alert)
                .foregroundColor(.red)
            TextField("Name", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 325, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
                .shadow(radius: 8)
            Button("Sign In", action:{
                if (!username.isEmpty){
                    
                    user.username = username
                    print("User's name: " + user.username)
                    ViewChanger.currentPage = .OrderScreen
                }
                else{
                    print("nothing typed")
                    alert = "Please actually enter your name"
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
#if DEBUG
let userData = User()
struct GuestSignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        GuestSignInScreen(user: User(), ViewChanger: viewChanger())
    }
}
#endif
