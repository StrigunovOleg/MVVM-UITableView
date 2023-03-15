//
//  ViewController.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 17.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var viewModel: TableViewModelType?
    
    //MARK: - Outlets
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ArrowTableViewCell.self, forCellReuseIdentifier: ArrowTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        
        viewModel = ViewModel()
        
        setupHierarchy()
        setupLayout()
    }
    
    
    //MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.bottom.right.equalTo(view)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.data[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let viewModel = viewModel else { return UITableViewCell() }
        let type = viewModel.cellType(for: indexPath)
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        
        switch type {
        case .switchCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell
            cell?.viewModel = cellViewModel
            return cell ?? UITableViewCell()
        case .arrowCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: ArrowTableViewCell.identifier, for: indexPath) as? ArrowTableViewCell
            cell?.viewModel = cellViewModel
            return cell  ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let viewModel = viewModel else { return }
        viewModel.selectRow(indexPath: indexPath)
        
        let detailVC = DetailViewController()
        detailVC.viewModel = viewModel.viewSelectedRow()
        
        if let navigator = navigationController {
            navigator.pushViewController(detailVC, animated: true)
        }
    }
}
