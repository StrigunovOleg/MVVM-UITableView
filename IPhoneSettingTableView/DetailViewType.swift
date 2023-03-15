//
//  DetailViewType.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 15.03.2023.
//

import Foundation

protocol DetailViewType {
    var title: String { get }
    var updateTitle: Box<String?> { get }
}
