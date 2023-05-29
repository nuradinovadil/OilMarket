//
//  CartTableViewCell.swift
//  Final Project
//
//  Created by Nuradinov Adil on 29/03/23.
//

import UIKit
import SnapKit

class CartTableViewCell: UITableViewCell {
    
    private lazy var productImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "AI-95")
        return imageView
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "AI 95"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "144.37$"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
       let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(deleteAction(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var increaseQuantityButton: UIButton = {
       let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemGray4
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        return button
    }()
    
    private var productQuantity = 1
    
    private lazy var productQuantityLabel: UILabel = {
       let label = UILabel()
        label.text = "x \(productQuantity)"
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private lazy var decreaseQuantityButton: UIButton = {
       let button = UIButton()
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.layer.cornerRadius = 15
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray4
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deleteAction(_ sender:UIButton) {
        print("Product deleted!")
    }
    
}

private extension CartTableViewCell {
    func setupViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productPriceLabel)
        contentView.addSubview(deleteButton)
        contentView.addSubview(increaseQuantityButton)
        contentView.addSubview(productQuantityLabel)
        contentView.addSubview(decreaseQuantityButton)
    }
    
    func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(25)
            make.width.equalTo(contentView).multipliedBy(0.2)
            make.height.equalTo(contentView).multipliedBy(0.6)
        }
        productNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalTo(productImageView.snp.trailing).offset(25)
        }
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(productImageView.snp.trailing).offset(25)
        }
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom)
            make.centerX.equalTo(productImageView.snp.centerX)
            make.width.equalTo(productImageView).multipliedBy(1.5)
        }
        increaseQuantityButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(contentView).multipliedBy(0.3)
        }
        productQuantityLabel.snp.makeConstraints { make in
            make.centerX.equalTo(increaseQuantityButton.snp.centerX)
            make.centerY.equalToSuperview()
            make.top.equalTo(increaseQuantityButton.snp.bottom).offset(3)
        }
        decreaseQuantityButton.snp.makeConstraints { make in
            make.centerX.equalTo(increaseQuantityButton.snp.centerX)
            make.top.equalTo(productQuantityLabel.snp.bottom).offset(3)
        }
    }
}

