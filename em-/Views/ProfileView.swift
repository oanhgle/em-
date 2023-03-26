//
//  ProfileView.swift
//  em-
//
//  Created by Oanh Le on 3/21/23.
//

import SwiftUI
import Solana
let endpoint = RPCEndpoint.devnetSolana
let router = NetworkingRouter(endpoint: endpoint)
let solana = Solana(router: router)

class AsyncModel : ObservableObject{
    @Published var balance = UInt64()
    func seeBalance() async throws -> UInt64{
        balance = try await solana.api.getBalance(account:"J1VXtZ3VeWiR5nxANoYGBh8ZKUxjEnorN6Si9f5NpiAr")
        return balance
    } //hard code
}

struct ProfileView: View {
    @State private var current_balance: UInt64 = 0
    @StateObject var asyncVM = AsyncModel()
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading) {
                HStack() {
                    Image(systemName: "sparkles")
                        .font(.system(size: 28))
                    Spacer()
                    Image("pfp").resizable()
                        .frame(width: 100.0, height: 100.0)
                    Spacer()
                    Image(systemName: "bell.badge")
                        .font(.system(size: 26))
                }
                .padding(.horizontal)
                
                Text("Hey, " + UserInSession.name)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.black)
                    .font(.custom("Bauziet", size: 32))
                    .padding(.top, 20)
                    .padding(.horizontal)
                
                Text("Welcome back ✌🏼")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.black.opacity(0.5))
                    .font(.custom("Bauziet-", size: 18))
                    .padding(.horizontal)
                    .padding(.top, 1)
                
                HStack(){
                    Image(systemName: "location.square")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    Text("Wallet").font(Font.custom("Bauziet", size: 15))
                }
                .offset(x:37)
                .padding(.top, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.1))
                        .frame(width: 300, height: 100)
                        .offset(y:20)
                    HStack(alignment: .center, spacing: 30) {
                        Image("wallet").resizable()
                            .frame(width: 100.0, height: 100.0)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Balance")
                                .font(.custom("Bauziet-", size: 15))
                                .padding(.top, 20)
                                .foregroundColor(.gray)
                            Text("\(current_balance) $BULLCOIN$")
                                .font(.custom("Bauziet", size: 16))
                                .padding(.top,0)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal)
                    }
                    .padding(20)
                    .padding(.horizontal)
                }
                HStack(alignment: .center, spacing: 10) {
                    Button {
                        // action
                        print("Reload balance")
                        Task{
                            current_balance = try await asyncVM.seeBalance()
                        }
                    } label: {
                        Text("Refresh")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(Font.custom("Bauziet", size: 18))
                            .foregroundColor(.black)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(width:125, height: 50)
                            )
                    }
                    Button {
                        // action
                        print("Send pressed")
                    } label: {
                        Text("Send")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(Font.custom("Bauziet", size: 18))
                            .foregroundColor(.black)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(width:125, height: 50)
                            )
                    }
                }
                .padding(10)
                .padding(.top, 10)
                .padding(.horizontal)
                HStack(){
                    Image(systemName: "location.square")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    Text("Archive").font(Font.custom("Bauziet", size: 15))
                }
                .offset(x:37)
                .padding(.top, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(){
                    Text("This section includes user's journal archives")
                        .font(Font.custom("Bauziet", size: 15))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal)
                .padding(.top, 10)
                .offset(x: -10)
                
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
