//
//  Bar_Order_AppApp.swift
//  Bar Order App
//
//  Created by Danny Makogon on 4/26/21.
//
import Combine
import SwiftUI

@main
struct Bar_Order_AppApp: App {
    @StateObject var ViewChanger = viewChanger()
    @StateObject var user = User()
    var body: some Scene {
        WindowGroup {
            MainView(ViewChanger: viewChanger(), user: User())
        }
    }
}
