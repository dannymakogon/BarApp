//
//  MainView.swift
//  DannyCypher
//
//  Created by Danny Makogon on 4/14/21.
//

import SwiftUI

struct MainView: View {
    @StateObject var ViewChanger: viewChanger
    @State var currentPage : Page = .LoginScreen
    @StateObject var user = User()
    var body: some View {
        switch ViewChanger.currentPage {
        case .LoginScreen:
            LoginScreen(ViewChanger: ViewChanger)
        case .AdminLoginScreen:
            AdminLoginScreen(ViewChanger: ViewChanger)
                .animation(.spring())
        case .GuestSignInScreen:
            GuestSignInScreen(user: User(), ViewChanger: ViewChanger)
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
        case .OrderScreen:
            OrderScreen(ViewChanger: ViewChanger, user: User())
        case .AdminScreen:
            AdminScreen(ViewChanger: ViewChanger)
        case .CustomDrinkScreen:
            CustomDrinkScreen(ViewChanger: ViewChanger)
        case .StockScreen:
            StockScreen(ViewChanger: ViewChanger)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(ViewChanger: viewChanger())
            .previewDevice("iPhone 12 Pro")
    }
}
