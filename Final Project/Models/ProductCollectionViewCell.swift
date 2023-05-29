//
//  ProductCollectionViewCell.swift
//  Final Project
//
//  Created by Nuradinov Adil on 14/03/23.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    private var wholeProductView = UIView()
    
    private lazy var productImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "AI-95")
        return imageView
    }()
    
    private lazy var productNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "AI-95"
        return label
    }()
    
    private lazy var productDesciptionLabel: UILabel = {
        let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 11)
         label.text = "Lorem ipsum is a placeholder text"
        label.textColor = .systemGray
         return label
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "$56"
        return label
    }()
    
    private lazy var productButton: UIButton = {
       let button = UIButton()
        button.setTitle( "Add", for: .normal)
        button.backgroundColor = .init(red: 30/255, green: 6/255, blue: 80/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ProductCollectionViewCell {
    func setupViews() {
        contentView.addSubview(wholeProductView)
        wholeProductView.addSubview(productImageView)
        wholeProductView.addSubview(productNameLabel)
        wholeProductView.addSubview(productDesciptionLabel)
        wholeProductView.addSubview(productPriceLabel)
        wholeProductView.addSubview(productButton)
    }
    func setupConstraints() {
        wholeProductView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView).multipliedBy(0.6)
        }
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        productDesciptionLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(3)
            make.leading.trailing.equalToSuperview()
        }
        productPriceLabel.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
        }
        productButton.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview()
            make.height.equalTo(productPriceLabel)
            make.width.equalTo(contentView).multipliedBy(0.45)
        }
    }
}
