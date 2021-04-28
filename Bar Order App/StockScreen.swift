//
//  StockScreen.swift
//  Bar Order App
//
//  Created by Danny Makogon on 4/26/21.
//

//MAKE TOGGLING WORK
import Combine
import SwiftUI

class Inventory: ObservableObject{
    var didChange = PassthroughSubject<Void,Never>()
    
    @Published var drink1Available = true {didSet {update()} }
    @Published var drink2Available = true {didSet {update()} }
    @Published var drink3Available = true {didSet {update()} }
    
    
    func update() {
        didChange.send()
    }
}

struct StockScreen: View {
    @StateObject var ViewChanger: viewChanger
    @ObservedObject var inventory = Inventory()
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
            Spacer()
            NavigationView{
                Form{
                    
                    Toggle(isOn: $inventory.drink1Available){
                            Text("Drink 1")
                        
                    }
                    Toggle(isOn: $inventory.drink2Available){
                        Text("Drink 2")
                    }
                    Toggle(isOn: $inventory.drink3Available){
                        Text("Drink 3")
                    }
                    
                    Button("Update Inventory", action: {
                        if (!inventory.drink1Available){
                            print("Drink 1 no longer available")
                        }
                        if (!inventory.drink2Available){
                            print("Drink 2 no longer available")
                        }
                        if (!inventory.drink3Available){
                            print("Drink 3 no longer available")
                        }
                        if (inventory.drink1Available && inventory.drink2Available && inventory.drink3Available){
                            print("All Drinks Available")
                        }
                        //send this to URL
                    }
                    )
                }.navigationBarTitle("Inventory")
                
            }
            
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
