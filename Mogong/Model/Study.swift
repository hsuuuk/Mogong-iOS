//
//  Study.swift
//  Mogong
//
//  Created by 심현석 on 2023/06/14.
//

import SwiftUI

enum StudyType: String, CaseIterable {
    case study = "스터디"
    case teamProject = "팀 프로젝트"
}

enum StudyMode: String, CaseIterable {
    case online = "온라인"
    case offline = "오프라인"
    case both = "온/오프라인"
}

enum Field: String, CaseIterable {
    case frontend = "프론트엔드"
    case backend = "백엔드"
    case designer = "디자이너"
    case aos = "AOS"
    case ios = "iOS"
}

enum ProfitGoal: String, CaseIterable {
    case yes = "있음"
    case no = "없음"
}

struct Study: Identifiable {
    let id: String
    let title: String
    let frequencyOfWeek: Int
    let durationOfMonth: Int
    let studyMode: StudyMode
    let totalMemberCount: Int
    let currentMember: [User]
    let introduction: String
    let memberPreference: String
    let hashtags: [String]
    let createDate: Date
    let dueDate: Date
    let languages: [Language]
    let fields: [Field]
    let profitGoal: ProfitGoal
    let recruitmentType: StudyType
    
    let isBookMarked: Bool
    let isCompleted: Bool

    init(title: String, frequencyOfWeek: Int, durationOfMonth: Int, studyMode: StudyMode, totalMemberCount: Int, introduction: String, memberPreference: String, hashtags: [String], dueDate: Date, languages: [Language], fields: [Field], profitGoal: ProfitGoal, recruitmentType: StudyType, isBookMarked: Bool, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.frequencyOfWeek = frequencyOfWeek
        self.durationOfMonth = durationOfMonth
        self.studyMode = studyMode
        self.totalMemberCount = totalMemberCount
        self.currentMember = []
        self.introduction = introduction
        self.memberPreference = memberPreference
        self.hashtags = hashtags
        self.createDate = Date()
        self.dueDate = dueDate
        self.languages = languages
        self.fields = fields
        self.profitGoal = profitGoal
        self.recruitmentType = recruitmentType
        self.isBookMarked = isBookMarked
        self.isCompleted = isCompleted
    }
}
