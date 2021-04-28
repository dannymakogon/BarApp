//
//  OrderScreen.swift
//  Bar Order App
//
//  Created by Danny Makogon on 4/26/21.
//
import Combine
import SwiftUI
class Order: ObservableObject{
    var didChange = PassthroughSubject<Void,Never>()
    
    static let drinks = ["Drink 1", "Drink 2", "Drink 3", "Danny Drink"]
    @Published var customDrinkOrder = "" {didSet {update()} }
    @Published var userName = "" {didSet {update()} }
    @Published var type = 0 {didSet {update()} }
    
    func isValid () -> Bool{
        if type == 3 {
            if !userName.isEmpty && !customDrinkOrder.isEmpty {
                return true
            }
        } else if !userName.isEmpty {
            return true
        }
        
        return false
    }
    func update() {
        didChange.send()
    }
}


struct OrderScreen: View {
    @ObservedObject var order = Order()
    @StateObject var ViewChanger: viewChanger
    @State private var success = false
    @State private var message = ""
    @StateObject var user: User
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
            Text(user.username)
            Spacer()
            
            
            Spacer()
            NavigationView{
                Form{
                    Picker(selection: $order.type, label: Text("Drink Order")){
                        ForEach(0 ..< Order.drinks.count){
                            Text(Order.drinks[$0]).tag($0)
                        }
                        
                    }
                    if order.type == 3 {
                        TextField("Custom Drink Order", text: $order.customDrinkOrder)
                    }
                    TextField("Your Name", text: $order.userName)
                    Section{
                        Button(action: {
                            print("Ordered")
                        }, label: {
                            Text("Place Order")
                        }
                        ).disabled(!order.isValid())
                    }
                }
            }
            Spacer()
        }
        
        
    }
    
}
#if DEBUG
struct OrderScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        OrderScreen(ViewChanger: viewChanger(), user: User())
    }
}
#endif
