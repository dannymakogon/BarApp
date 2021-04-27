//
//  GuestSignInScreen.swift
//  Bar Order App
//
//  Created by Danny Makogon on 4/26/21.
//

import SwiftUI

struct CustomDrinkScreen: View {
    @StateObject var ViewChanger: viewChanger
    @State private var drinkOrder = ""
    @State private var alert = ""
    @State private var success = false
    var body: some View {
        VStack{
            HStack (spacing: 86){
                Button(action: {
                    ViewChanger.currentPage = .OrderScreen
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
            if success == true{
            Text(alert)
                .foregroundColor(.green)
            }
            else{
                Text(alert)
                    .foregroundColor(.red)
            }
            TextField("Whatchu want", text: $drinkOrder)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 325, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
                .shadow(radius: 8)
            Button("Order", action:{
                if (!drinkOrder.isEmpty){
                    print("User's order: " + drinkOrder)
                    success = true
                    alert = "Drink Ordered!"
                }
                else{
                    print("nothing typed")
                    alert = "At least tell me something"
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

struct CustomeDrinkScreen_Previews: PreviewProvider {
    static var previews: some View {
        CustomDrinkScreen(ViewChanger: viewChanger())
    }
}
