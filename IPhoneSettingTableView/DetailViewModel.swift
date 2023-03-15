//
//  DetailViewModel.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 15.03.2023.
//

import Foundation

class DetailViewModel: DetailViewType {
    
    var title: String {
        return data.title
    }
    
    var updateTitle: Box<String?> = Box(value: nil)
    
    private var data: SettingModel
    
    init(data: SettingModel) {
        self.data = data
    }
    
}
