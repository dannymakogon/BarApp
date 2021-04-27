//
//  AdminScreen.swift
//  Bar Order App
//
//  Created by Danny Makogon on 4/26/21.
//

import SwiftUI

struct AdminScreen: View {
    @StateObject var ViewChanger: viewChanger
    @State var orderName = ""
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    ViewChanger.currentPage = .LoginScreen
                }, label: {
                Image(systemName: "arrowshape.turn.up.backward")
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
                })
                Spacer()
            Text("Bar App")
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.black)
                .padding()
                Spacer()
                Button(action: {
                    print("Extra")
                    ViewChanger.currentPage = .StockScreen
                }, label: {
                    Image(systemName: "exclamationmark.square")
                        .font(.system(size: 30))
                        .foregroundColor(.blue)
                })
            }
            Text("Admin Screen")
                .padding(.bottom, 60)
            
            
                Text("Incoming Orders")
                    .underline()
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .frame(alignment: .leading)
            ScrollView (.vertical, showsIndicators: true){
            VStack{ //whole form
                
                DannyOrder()
                GavinsOrder()
                EthansOrder()
                SamsOrder()
                }
                //end of Vstack
                .frame(width: 400, alignment: .leading)
            }
            Spacer()
            
        }
    }
}

struct AdminScreen_Previews: PreviewProvider {
    static var previews: some View {
        AdminScreen(ViewChanger: viewChanger())
    }
}

struct DannyOrder: View {
    var body: some View {
        VStack{ //single order vstack
            
            HStack(){ //username and checkboxes
                
                Text("Danny's Order")
                    .font(.system(size: 25))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Spacer()
                Button(action: {
                    print("Danny's Order Completed")
                    //do stuff
                }, label: {
                    Image(systemName: "checkmark.square.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.green)
                })
                .padding(.trailing, 30)
                Button(action: {
                    print("Danny's Order Rejected")
                    //do stuff
                }, label: {
                    Image(systemName: "xmark.square.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.red)
                })
            }
            Text("Order Details:")
                .font(.system(size:20))
                .underline()
                .padding()
            Text("PinaColada with a dash of lemonjuice and a cookie please")
                .font(.system(size: 20))
        } //end of specific order box
        .border(Color.black)
        .padding()
    }
}

struct GavinsOrder: View {
    var body: some View {
        VStack{ //single order vstack
            HStack(){ //username and checkboxes
                Text("Gavin's Order")
                    .font(.system(size: 25))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Spacer()
                Button(action: {
                    print("Gavin's Order Completed")
                    //do stuff
                }, label: {
                    Image(systemName: "checkmark.square.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.green)
                })
                .padding(.trailing, 30)
                Button(action: {
                    print("Gavin's Order Rejected")
                    //do stuff
                }, label: {
                    Image(systemName: "xmark.square.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.red)
                })
            }
            Text("Order Details:")
                .font(.system(size:20))
                .underline()
                .padding()
            Text("The Wolf of Wall Street Cocktail, extra ludes")
                .font(.system(size: 20))
        } //end of specific order box
        .border(Color.black)
        .padding()
    }
}

struct EthansOrder: View {
    var body: some View {
        VStack{ //single order vstack
            HStack(){ //username and checkboxes
                Text("Ethan's Order")
                    .font(.system(size: 25))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Spacer()
                Button(action: {
                    print("Ethan's Order Completed")
                    //do stuff
                }, label: {
                    Image(systemName: "checkmark.square.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.green)
                })
                .padding(.trailing, 30)
                Button(action: {
                    print("Ethan's Order Rejected")
                    //do stuff
                }, label: {
                    Image(systemName: "xmark.square.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.red)
                })
            }
            Text("Order Details:")
                .font(.system(size:20))
                .underline()
                .padding()
            Text("The licorice stuff that i like")
                .font(.system(size: 20))
        } //end of specific order box
        .border(Color.black)
        .padding()
    }
}

struct SamsOrder: View {
    var body: some View {
        VStack{ //single order vstack
            
            HStack(){ //username and checkboxes
                
                Text("Sam's Order")
                    .font(.system(size: 25))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Spacer()
                Button(action: {
                    print("Sam's Order Completed")
                    //do stuff
                }, label: {
                    Image(systemName: "checkmark.square.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.green)
                })
                .padding(.trailing, 30)
                Button(action: {
                    print("Sam's Order Rejected")
                    //do stuff
                }, label: {
                    Image(systemName: "xmark.square.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.red)
                })
            }
            Text("Order Details:")
                .font(.system(size:20))
                .underline()
                .padding()
            Text("Please just get me as drunk as possible")
                .font(.system(size: 20))
        } //end of specific order box
        .border(Color.black)
        .padding()
    }
}
