//
//  TableViewModelType.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 10.03.2023.
//

import Foundation

protocol TableViewModelType {
    var numberOfRows: Int { get }
    var data: [[SettingModel]] { get }
    func cellType(for indexPath: IndexPath) -> CellType
    func cellViewModel(for indexPath: IndexPath) -> TableViewCellViewModelType?
    
    func viewSelectedRow() -> DetailViewType?
    func selectRow(indexPath: IndexPath)
}
