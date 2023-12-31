//
//  UserPageView.swift
//  Mogong
//
//  Created by 심현석 on 2023/06/29.
//

import SwiftUI

struct UserPageView: View {
    @EnvironmentObject var viewModel: ApplicationViewModel
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Image(viewModel.selectedApplication.user.userimageString)
                .resizable()
                .frame(width: 60, height: 60)
                .scaledToFit()
                .clipShape(Circle())
                .foregroundColor(.gray)
                .padding(.top, 40)
            
            Text(Application.application1.user.username)
                .font(Font.system(size: 28, weight: .bold))
                .foregroundColor(.black)
            
            Text(Application.application1.position.rawValue)
                .font(Font.system(size: 16, weight: .regular))
                .foregroundColor(.gray)
                .padding(.bottom, 50)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("간단한 자기소개")
                        .font(.pretendard(weight: .bold, size: 20))
                    
                    Spacer()
                        .frame(height: 15)
                    
                    Text(Application.application1.introduction)
                    
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Text("프로젝트 경험 여부")
                        .font(.pretendard(weight: .bold, size: 20))
                    
                    Text(Application.application1.experience)
                }
                
                Spacer()
            }
            
            Spacer()
            
//            SelectButton(title: "채팅하기", state: .selected) {
//                isPresented = true
//            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
//        .navigationDestination(isPresented: $isPresented) {
//            ChatView(chat: Chat(participant1: User.user1,
//                                participant2: User.user2))
//        }
    }
}

struct UserPageView_Previews: PreviewProvider {
    static var previews: some View {
        UserPageView()
            .environmentObject(ApplicationViewModel())
    }
}
