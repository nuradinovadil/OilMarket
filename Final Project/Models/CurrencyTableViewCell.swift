//
//  CurrencyTableViewCell.swift
//  Final Project
//
//  Created by Nuradinov Adil on 02/04/23.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    var currencyManager = APICaller()
    
    private lazy var currencyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "USD")
        return imageView
    }()
    
    private lazy var currencyNameLabel: UILabel = {
       let label = UILabel()
        label.text = "USD"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var currencyDescLabel: UILabel = {
       let label = UILabel()
        label.text = "Доллар США"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var currencyPriceLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "000"
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
    
    func setCurrency(with name: String, image: String, desc: String) {
        currencyNameLabel.text = "\(name)"
        currencyImageView.image = UIImage(named: "\(image)")
        currencyDescLabel.text = "\(desc)"
        
    }
    
    func setPrice(price: String) {
        DispatchQueue.main.async {
            self.currencyPriceLabel.text = "\(price)"
        }
    }
}

private extension CurrencyTableViewCell {
    func setupViews() {
        contentView.addSubview(currencyImageView)
        contentView.addSubview(currencyNameLabel)
        contentView.addSubview(currencyPriceLabel)
        contentView.addSubview(currencyDescLabel)
    }
    func setupConstraints() {
        currencyImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
            make.width.equalTo(currencyImageView.snp.height)
        }
        currencyNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(currencyImageView.snp.trailing).offset(15)
            make.top.equalToSuperview().offset(20)
        }
        currencyDescLabel.snp.makeConstraints { make in
            make.leading.equalTo(currencyImageView.snp.trailing).offset(15)
            make.top.equalTo(currencyNameLabel.snp.bottom).offset(5)
        }
        currencyPriceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(250)
            make.bottom.equalTo(currencyNameLabel.snp.bottom)
        }
    }
}
