//
//  SettingsViewController.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 22.03.2023.
//

import Foundation
//
//  ViewController.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 17.01.2023.
//

import UIKit
import SnapKit

class SettingsViewController: UIView {
    
    //var viewModel: TableViewModelType?
    
    func cofigurationView(model: SettingModel) {
        
    }
    
    
    //MARK: - Outlets
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ArrowTableViewCell.self, forCellReuseIdentifier: ArrowTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
       
        return tableView
    }()
    
    
    // MARK: - Initial
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    
    private func commonInit() {
        backgroundColor = .white
        
        setupHierarchy()
        setupLayout()
    }
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Настройки"
//
//        viewModel = ViewModel()
//
//        setupHierarchy()
//        setupLayout()
//    }
    
    
    //MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.left.bottom.right.equalTo(self)
        }
    }
}


