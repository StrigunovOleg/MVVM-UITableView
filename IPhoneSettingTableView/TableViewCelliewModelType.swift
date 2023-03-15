//
//  TableViewCelliewModelType.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 11.03.2023.
//

import Foundation

protocol TableViewCellViewModelType: AnyObject {
    var title: String { get }
    var image: String { get }
    var imageColor: String { get }
    var status: ArgumentStatus { get }
    var message: Message { get }
    var cellType: CellType { get }
}
