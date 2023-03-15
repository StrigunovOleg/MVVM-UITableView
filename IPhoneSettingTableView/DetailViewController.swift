//
//  DetailViewController.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 14.03.2023.
//

import UIKit
import SnapKit


class DetailViewController: UIViewController {
    
    var viewModel: DetailViewType?
    
    //MARK: - Outlets
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "welcome"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        self.label.text = viewModel.title
        
        setupHierarchy()
        setupLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.updateTitle.bind { [unowned self] in
            guard let string = $0 else { return }
            self.label.text = string
        }
        
        delay(delay: 5) { [unowned self] in
            self.viewModel?.updateTitle.value = " new string "
        }
    }

    private func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            closure()
        }
    }
    
    
    //MARK: - Setup
    
    private func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(label)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 250),
            label.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
}
