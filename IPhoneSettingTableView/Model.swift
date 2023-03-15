//
//  Model.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 17.01.2023.
//


import Foundation

struct SettingModel {
    var title: String
    var image: String
    var imageColor: String
    var status: ArgumentStatus
    var message: Message
    var cellType: CellType
    
}

enum CellType {
    case switchCell
    case arrowCell
}

enum ArgumentStatus: String {
    case notConnected = "Не подключено"
    case arrowOn = "Вкл."
    case switchOn = "On"
    case switchOff = "Off"
    case none = ""
}

enum Message: String {
    case no = ""
    case one = "1.circle.fill"
    case two = "2.circle.fill"
    case three = "3.circle.fill"
}
