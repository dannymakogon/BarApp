//
//  StockScreen.swift
//  Bar Order App
//
//  Created by Danny Makogon on 4/26/21.
//

//MAKE TOGGLING WORK

import SwiftUI

struct StockScreen: View {
    @StateObject var ViewChanger: viewChanger
    @State private var confirmLogoutAlert = false
    @State private var confirmLogout = false
    @State private var outOfStockDrink = ""
    @State private var outOfStock1 = false //MAKE TOGGLE
    @State private var outOfStock2 = false //MAKE TOGGLE
    @State private var outOfStock3 = false //MAKE TOGGLE
    var body: some View {
        VStack{
            HStack (spacing: 86){
                Button(action: {
                    ViewChanger.currentPage = .AdminScreen
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
            Text("Inventory")
            Spacer()
            Text("Whats out of stock?")
                .underline()
                .font(.system(size: 32, weight: .medium, design: .default))
            Spacer()
            VStack (spacing: 50){
            Button(action: {
                print("First Drink out of stock")
                self.confirmLogoutAlert = true
                outOfStockDrink = "Drink 1"
                outOfStock1 = true
            }, label: {
                if (!outOfStock1){
                Image(systemName: "1.square.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                }else{
                    Image(systemName: "1.square.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.red)
                }
            }
            )
            
            Button(action: {
                print("Second Drink out of stock")
                self.confirmLogoutAlert = true
                outOfStockDrink = "Drink 2"
                outOfStock2 = true
            }, label: {
                if (!outOfStock2){
                Image(systemName: "2.square.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                }else {
                    Image(systemName: "2.square.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.red)
                }
            }
            )
            Button(action: {
                print("Third drink out of stock")
                self.confirmLogoutAlert = true
                outOfStockDrink = "Drink 3"
                outOfStock3 = true
            }, label: {
                if (!outOfStock3){
                Image(systemName: "3.square.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                } else {
                    Image(systemName: "3.square.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.red)
                }
            }
            )
            }
            Spacer()
            
        }.alert(isPresented: $confirmLogoutAlert) { () -> Alert in
            Alert(title: Text("Confirm Change"), message: Text(outOfStockDrink + " is about to be marked as Sold Out"),
                  primaryButton: .default (Text("OK")) {
                    //mark as unavialable to user
                    //print(ViewChanger.$currentPage)
                  }, secondaryButton: .cancel()
            )
            }
        
    }
}

struct StockScreen_Previews: PreviewProvider {
    static var previews: some View {
        StockScreen(ViewChanger: viewChanger())
    }
}
