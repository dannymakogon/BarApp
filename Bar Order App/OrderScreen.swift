//
//  OrderScreen.swift
//  Bar Order App
//
//  Created by Danny Makogon on 4/26/21.
//
import Combine
import SwiftUI
class Order: ObservableObject {
//    enum CodingKeys: String, CodingKey {
//        case customDrinkOrder, userName, type
//    }
    
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
    @State private var confirmOrderAlert = false
    @State private var orderConfirmed = false
    @State private var success = false
    @State private var message = ""
    @StateObject var user: User
    var body: some View {
        VStack{
            HStack (spacing: 100){
                Button(action: {
                    ViewChanger.currentPage = .LoginScreen
                }, label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .font(.system(size: 30))
                        .foregroundColor(.blue)
                })
                Image("screen-4")
                Spacer()
                
            }
            
            
            
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
                            confirmOrderAlert = true
                        }, label: {
                            Text("Place Order")
                        }
                        ).disabled(!order.isValid())
                    }
                }.navigationBarTitle("Drink Order")
                
            }
            Spacer()
        }.alert(isPresented: $confirmOrderAlert) { () -> Alert in
            Alert(title: Text("Ready to order " + Order.drinks[order.type] + "?"), message: Text("You're about to order "),
                  primaryButton: .default (Text("OK")) {
//                    self.placeOrder()
                    //print(ViewChanger.$currentPage)
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                    let content = UNMutableNotificationContent()
                    content.title = "Your drink has been Ordered"
                    content.subtitle = "We'll let you know when it's done"
                    content.sound = UNNotificationSound.default

                    // show this notification five seconds from now
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                    // choose a random identifier
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                    // add our notification request
                    UNUserNotificationCenter.current().add(request)

                    print("\(order.userName) ordered \(Order.drinks[order.type])")
                  }, secondaryButton: .cancel()
            )
            }
//        .alert(isPresented: $orderConfirmed) { () -> Alert in
//            Alert(title: Text("Order confirmed"), message: Text(" \(Order.drinks[order.type]) was ordered – we'll send you a notification when it's ready!"), dismissButton: .default(Text("OK")))
//        }
        
        //add message for when drink has gone through
        
    }
//    func placeOrder(){
//
//    }
}
#if DEBUG
struct OrderScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        OrderScreen(ViewChanger: viewChanger(), user: User())
    }
}
#endif
