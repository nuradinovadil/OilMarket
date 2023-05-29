//
//  CarouselCollectionViewCell.swift
//  Final Project
//
//  Created by Nuradinov Adil on 14/03/23.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    private lazy var carouselImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.sizeToFit()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(with image: String) {
        carouselImageView.image = UIImage(named: image)
    }
}

private extension CarouselCollectionViewCell {
    func setupViews() {
        contentView.addSubview(carouselImageView)
    }
    
    func setupConstraints() {
        carouselImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


