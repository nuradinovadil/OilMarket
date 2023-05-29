//
//  SettingsTableViewCell.swift
//  Final Project
//
//  Created by Nuradinov Adil on 15/03/23.
//

import UIKit

class ContactUsTableViewCell: UITableViewCell {
    
    private lazy var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house.fill")
        imageView.tintColor = .init(red: 151/255, green: 93/255, blue: 196/255, alpha: 1)
        return imageView
    }()
    
    private lazy var cellName: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Website"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureNameAndImage(text: String, image: String) {
        cellName.text = text
        cellImageView.image = UIImage(systemName: image)
    }
    
}

private extension ContactUsTableViewCell {
    func setupViews() {
        contentView.addSubview(cellImageView)
        contentView.addSubview(cellName)
    }
    func setupConstraints() {
        cellImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        cellName.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(cellImageView.snp.trailing).offset(20)
        }
    }
}
