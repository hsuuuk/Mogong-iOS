//
//  UsernameView.swift
//  Mogong
//
//  Created by 심현석 on 2023/06/15.
//

import SwiftUI

struct UsernameView: View {
    @State private var username = ""

    
    var body: some View {
        VStack {
            Spacer()
                .frame(maxHeight: 100)
            
            Text("닉네임을 입려해주세요.")
                .font(.largeTitle)
            
            Spacer()
                .frame(maxHeight: 100)
            
            VStack(spacing: 10) {
                TextField("닉네임", text: $username)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 1)
                    }
                
                Button {
                    
                } label: {
                    Text("입력")
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(5)
                }
            }
            .frame(width: 300)
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct UsernameView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameView()
    }
}

