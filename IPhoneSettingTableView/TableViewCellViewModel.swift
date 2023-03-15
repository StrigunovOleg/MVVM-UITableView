//
//  TableViewCellViewModel.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 11.03.2023.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    private var data: SettingModel
    
    var title: String {
        return data.title
    }
    
    var image: String {
        return data.image
    }
    
    var imageColor: String {
        return data.imageColor
    }
    
    var status: ArgumentStatus  {
        return data.status
    }
    
    var message: Message {
        return data.message
    }
    
    var cellType: CellType {
        return data.cellType
    }
    
    init(data: SettingModel) {
        self.data = data
    }
}
