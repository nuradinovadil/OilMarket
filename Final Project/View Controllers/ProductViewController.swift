//
//  ProductViewController.swift
//  Final Project
//
//  Created by Nuradinov Adil on 14/03/23.
//

import UIKit

class ProductViewController: UIViewController {

    private var whiteView = UIView()
    private var wholeView = UIView()
    
    let greyColor = UIColor.init(red: 151/255, green: 93/255, blue: 196/255, alpha: 1)
    
    private var pruductQuantity = 1
    
    private lazy var productImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "AI-95")
        return imageView
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "AI-95"
        return label
    }()
    
    private lazy var productPriceLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "$56"
        return label
    }()
    
    private lazy var productCategoryLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray2
        label.text = "Бензин"
        return label
    }()
    
    private lazy var minusProductButton: UIButton = {
       let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        button.addTarget(self, action: #selector(dicreaseQuantity), for: .touchUpInside)
        return button
    }()
    
    private lazy var productQuantityLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.layer.backgroundColor = .init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.textAlignment = .center
        label.text = "\(pruductQuantity)"
        return label
    }()
    
    private lazy var plusProductButton: UIButton = {
       let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(increaseQuantity), for: .touchUpInside)
        return button
    }()
    
    private lazy var descLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "DESCRIPTION"
        return label
    }()
    
    private lazy var descLabelTwo: UILabel = {
       let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var addToCartButton: UIButton = {
       let button = UIButton()
        button.setTitle("Add to Cart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .init(red: 30/255, green: 6/255, blue: 80/255, alpha: 1)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(self.buttonAction), for: .allTouchEvents)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()

        view.backgroundColor = .init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 25
        whiteView.clipsToBounds = true
    }
    
    func configureLabel(with quantity: Int) {
        productQuantityLabel.text = "\(quantity)"
    }
    
    @objc func buttonAction(_ sender:UIButton)
        {
            print("Button tapped")
        }
    
    @objc func dicreaseQuantity() {
        if pruductQuantity > 1 {
                pruductQuantity -= 1
                productQuantityLabel.text = "\(pruductQuantity)"
            }
    }
    
    @objc func increaseQuantity() {
        pruductQuantity += 1
        productQuantityLabel.text = "\(pruductQuantity)"
    }

}

private extension ProductViewController {
    func setupViews() {
        view.addSubview(productImageView)
        view.addSubview(whiteView)
        whiteView.addSubview(wholeView)
        wholeView.addSubview(productNameLabel)
        wholeView.addSubview(productCategoryLabel)
        wholeView.addSubview(productPriceLabel)
        wholeView.addSubview(minusProductButton)
        wholeView.addSubview(productQuantityLabel)
        wholeView.addSubview(plusProductButton)
        wholeView.addSubview(descLabel)
        wholeView.addSubview(descLabelTwo)
        wholeView.addSubview(addToCartButton)
        
    }
    func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(30)
            make.leading.trailing.bottom.equalToSuperview()
        }
        wholeView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(20)
        }
        productNameLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        productCategoryLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
        }
        minusProductButton.snp.makeConstraints { make in
            make.top.equalTo(productCategoryLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.height.equalTo(productQuantityLabel)
            make.width.equalTo(productQuantityLabel).multipliedBy(0.4)
        }
        productQuantityLabel.snp.makeConstraints { make in
            make.top.equalTo(productCategoryLabel.snp.bottom).offset(5)
            make.leading.equalTo(minusProductButton.snp.trailing)
            make.width.equalTo(view).multipliedBy(0.24)
        }
        plusProductButton.snp.makeConstraints { make in
            make.top.equalTo(productCategoryLabel.snp.bottom).offset(5)
            make.leading.equalTo(productQuantityLabel.snp.trailing)
            make.height.width.equalTo(minusProductButton)
        }
        productPriceLabel.snp.makeConstraints { make in
            make.leading.equalTo(plusProductButton.snp.trailing).offset(100)
            make.bottom.equalTo(plusProductButton.snp.bottom)
        }
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(productQuantityLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
        }
        descLabelTwo.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
        }
        addToCartButton.snp.makeConstraints { make in
            make.top.equalTo(descLabelTwo.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.08)
        }
    }
}
