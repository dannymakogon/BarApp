//
//  OrderScreen.swift
//  Bar Order App
//
//  Created by Danny Makogon on 4/26/21.
//

import SwiftUI

struct OrderScreen: View {
    @StateObject var ViewChanger: viewChanger
    @State private var success = false
    @State private var message = ""
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
            Spacer()
            if success{
                Text(message)
                    .foregroundColor(.green)
            }
            
            Spacer()
            VStack (spacing:50){
                Button(action: {
                    print("Order First Drink")
                    success = true
                    message = "Drink 1 ordered"
                }, label: {
                    Image(systemName: "1.square.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.blue)
                }
                )
                
                //TWO BUTTON
                Button(action: {
                    print("Order Second Drink")
                    success = true
                    message = "Drink 2 ordered"
                }, label: {
                    Image(systemName: "2.square.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.blue)
                }
                )
                
                //Three Button
                Button(action: {
                    print("Order third drink")
                    success = true
                    message = "Drink 3 ordered"
                }, label: {
                    Image(systemName: "3.square.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.blue)
                }
                )
                //Custom Button
                Button(action: {
                    print("Order custome drink")
                    ViewChanger.currentPage = .CustomDrinkScreen
                }, label: {
                    Text("Custom Order")
                        .font(.system(size: 25))
                }
                )
                
            }
            Spacer()
        }
    }
}

struct OrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        OrderScreen(ViewChanger: viewChanger())
    }
}
