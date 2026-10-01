//
//  SettingsItem.swift
//  m2l5
//
//  Created by AndreyM on 30.09.2026.
//
import Foundation

struct settingItem {
    var icon : String
    var title : String
    var sub: String
    
    static func mockDataFirst() -> [settingItem]{
        [
            settingItem(icon: "message.fill", title: "User1", sub: ""),
            settingItem(icon: "message.fill", title: "User2", sub: ""),
            settingItem(icon: "message.fill", title: "User3", sub: ""),
            settingItem(icon: "message.fill", title: "User4", sub: ""),
            settingItem(icon: "message.fill", title: "User5", sub: ""),
            settingItem(icon: "message.fill", title: "User6", sub: ""),
            settingItem(icon: "message.fill", title: "User7", sub: ""),
            settingItem(icon: "message.fill", title: "User8", sub: ""),
        ]
    }
    
    static func mockDataSecond() -> [settingItem]{
        [
            settingItem(icon: "message.fill", title: "User1", sub: "1"),
            settingItem(icon: "message.fill", title: "User2", sub: "2"),
            settingItem(icon: "message.fill", title: "User3", sub: "3"),
            settingItem(icon: "message.fill", title: "User4", sub: "4"),
            settingItem(icon: "message.fill", title: "User5", sub: "5"),
            settingItem(icon: "message.fill", title: "User6", sub: "6"),
            settingItem(icon: "message.fill", title: "User7", sub: "7"),
            settingItem(icon: "message.fill", title: "User8", sub: "8"),
        ]
    }
}
