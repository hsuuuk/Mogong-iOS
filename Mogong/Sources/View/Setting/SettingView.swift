//
//  SettingView.swift
//  Mogong
//
//  Created by 심현석 on 2023/07/26.
//

import SwiftUI
import MessageUI

struct SettingView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var username = "민수민수"
    @State private var changeUsername: Bool = false
    @FocusState var focuseUsername: Bool
    
    @State private var showEmailSender = false
    @State private var showSignOutAlert = false
    
    var body: some View {
            VStack(spacing: 20) {
                Spacer().frame(height: 15)
                
//                NavigationLink {
//                    EditUserInfo()
//                } label: {
//                    HStack {
//                        Text("닉네임")
//                            .font(.pretendard(weight: .bold, size: 18))
//                            .foregroundColor(.black)
//                        Spacer()
//                        Text("\(username)")
//                            .foregroundColor(.black)
//                        Image(systemName: "chevron.right")
//                            .foregroundColor(.black)
//                    }
//                }
//                Divider()
                
                VStack(spacing: 20) {
                    rightArrowLabel(title: "문의하기")
                        .onTapGesture {
                            showEmailSender = true
                        }
                    Divider()
                    
                    NavigationLink {
                        PolicyView()
                            .navigationTitle("개인정보처리방침")
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        rightArrowLabel(title: "개인정보처리방침")
                    }
                    Divider()
                    
                    HStack {
                        Text("앱 버전")
                            .font(.pretendard(weight: .bold, size: 18))
                        Spacer()
                        Text("1.0")
                            .font(.pretendard(weight: .regular, size: 18))
                    }
                    Divider()
                }
                
                HStack {
                    Spacer()
                    Text("로그아웃")
                        .font(.pretendard(weight: .semiBold, size: 15))
                        .foregroundColor(.red)
                        .onTapGesture {
                            showSignOutAlert = true
                        }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .navigationBarTitle("설정", displayMode: .large)
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showEmailSender, content: {
                if MFMailComposeViewController.canSendMail() {
                    EmailSender()
                }
            })
            .alert("로그아웃", isPresented: $showSignOutAlert) {
                Button("확인") {
                    authViewModel.signOut()
                    authViewModel.currentUser = nil
                }
                
                Button(role: .cancel) {
                } label: {
                    Text("취소")
                }
            } message: {
                Text("로그아웃 하시겠습니까?")
            }
    }
}

struct rightArrowLabel: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.pretendard(weight: .bold, size: 18))
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.black)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

