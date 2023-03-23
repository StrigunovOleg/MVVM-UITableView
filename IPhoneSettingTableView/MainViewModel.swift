//
//  ViewModel.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 11.03.2023.
//

import Foundation

class ViewModel: TableViewModelType {
    
    private var selectedIndexPath: IndexPath?
    
    var data: [[SettingModel]] = [
        [SettingModel(title: "Авиарежим", image: "airplane", imageColor: "c_orange", status: .switchOff, message: .no, cellType: .switchCell),
         SettingModel(title: "Wi-Fi", image: "wifi", imageColor: "c_blue", status: .notConnected, message: .no, cellType: .arrowCell),
         SettingModel(title: "Bluetooth", image: "bluetooth", imageColor: "c_blue", status: .arrowOn, message: .no, cellType: .arrowCell),
         SettingModel(title: "Сотовая связь", image: "antenna.radiowaves.left.and.right", imageColor: "c_green", status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Режим модема", image: "personalhotspot", imageColor: "c_green", status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "VPN", image: "vpn", imageColor: "c_blue", status: .switchOff, message: .no, cellType: .switchCell)],
        
        [SettingModel(title: "Уведомления", image: "notification", imageColor: "c_red", status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Звуки, тактильные сигналы", image: "speaker.wave.3.fill", imageColor: "c_red", status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Не беспокоить", image: "moon.fill", imageColor: "c_grape", status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Экранное время", image: "hourglass", imageColor: "c_grape", status: .none, message: .no, cellType: .arrowCell)],
        
        [SettingModel(title: "Основное", image: "gear", imageColor: "c_gray", status: .none, message: .one, cellType: .arrowCell),
         SettingModel(title: "Пункт управления", image: "switch.2", imageColor: "c_gray", status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Экран и яркость", image: "textformat.size", imageColor: "c_blue", status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Экран \"Домой\"", image: "display_home", imageColor: "c_blue", status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Универсальный доступ", image: "person.circle", imageColor: "c_blue", status: .none, message: .no, cellType: .arrowCell)]
    ]
    
    var numberOfRows: Int {
        return data.count
    }
    
    func cellType(for indexPath: IndexPath) -> CellType {
        return data[indexPath.section][indexPath.row].cellType
    }
    
    func cellViewModel(for indexPath: IndexPath) -> TableViewCellViewModelType? {
        let data = data[indexPath.section][indexPath.row]
        return TableViewCellViewModel(data: data)
    }
    
    
    func selectRow(indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func viewSelectedRow() -> DetailViewType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(data: data[selectedIndexPath.section][selectedIndexPath.row])
    }
    
}
