//
//  HStakTeamMemberView.swift
//  Mogong
//
//  Created by 심현석 on 2023/07/06.
//

import SwiftUI

struct HStakTeamMemberView: View {
    var member: Member
    var isSelected: Bool
    var isHost: Bool
    
    var body: some View {
        HStack {
            ZStack {
                if isSelected {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(Color.red, lineWidth: 3)
                        }
                    
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.white, .red)
                        .padding(.leading, -35)
                        .padding(.top, -35)
                } else {
                    ZStack {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .scaledToFit()
                            .clipShape(Circle())
                        
                        if isHost {
                            Image(systemName: "bookmark.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.white, .blue)
                                .padding(.leading, -35)
                                .padding(.top, -35)
                        }
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text(member.user.username)
                    .font(Font.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                
                Text("프론트엔드")
                    .font(Font.system(size: 14, weight: .regular))
                    .foregroundColor(.gray)
            }
        }
    }
}

struct HStakTeamMemberView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStakTeamMemberView(
                member: Member(user: User(id: "1", name: "김민수", email: "a@gmail.com", username: "민수민수"), field: .backend),
                isSelected: true,
                isHost: false
            )
            HStakTeamMemberView(
                member: Member(user: User(id: "1", name: "김민수", email: "a@gmail.com", username: "민수민수"), field: .backend),
                isSelected: false,
                isHost: true
            )
            HStakTeamMemberView(
                member: Member(user: User(id: "1", name: "김민수", email: "a@gmail.com", username: "민수민수"), field: .backend),
                isSelected: false,
                isHost: false
            )
        }
        .environmentObject(ApplicationViewModel())
    }
}
