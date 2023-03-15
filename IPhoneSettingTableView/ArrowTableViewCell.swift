//
//  CustomTableViewCell.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 17.01.2023.
//


import UIKit

class ArrowTableViewCell: UITableViewCell {
    
    static let identifier = "ArrowTableViewCell"
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            title.text = viewModel.title
            status.text = viewModel.status.rawValue
            if let systemName = UIImage(systemName: viewModel.image ), systemName.isSymbolImage {
               image.image = UIImage(systemName: viewModel.image )?.withTintColor(.white, renderingMode: .alwaysOriginal)
            } else {
                image.image = UIImage(named: viewModel.image)
            }
            message.image = UIImage(systemName: viewModel.message.rawValue)?.withTintColor(.red, renderingMode: .alwaysOriginal)
            wrapper.backgroundColor = UIColor(named: viewModel.imageColor)
        }
    }
    
    
    
    
    //MARK: - Outlets

    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let status: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let message: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let wrapper: UIView = {
         let mainView = UIView()
         mainView.layer.cornerRadius = 6
         return mainView
     }()
    
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()

        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setups
    
    private func setupHierarchy() {
        addSubview(title)
        addSubview(status)
        addSubview(wrapper)
        addSubview(message)
        wrapper.addSubview(image)
    }
    
    private func setupLayout() {
        wrapper.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(20)
            make.centerY.equalTo(self.snp.centerY)
            make.height.equalTo(28)
            make.width.equalTo(28)
        }

        image.snp.makeConstraints { make in
            make.centerY.equalTo(wrapper.snp.centerY)
            make.centerX.equalTo(wrapper.snp.centerX)
            make.height.equalTo(22)
            make.width.equalTo(22)
        }
        
        title.snp.makeConstraints { make in
            make.left.equalTo(wrapper.snp.right).offset(5)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        status.snp.makeConstraints { make in
            make.right.equalTo(-40)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        message.snp.makeConstraints { make in
            make.right.equalTo(status.snp.left).offset(-4)
            make.centerY.equalTo(self.snp.centerY)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
    }
}
