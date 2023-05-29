//
//  HomeViewController.swift
//  Final Project
//
//  Created by Nuradinov Adil on 13/03/23.
//
import Foundation
import UIKit

class HomeViewController: UIViewController{
    
    private var wholeView = UIView()
    private var scrollView = UIScrollView()
    
    private lazy var companyLogo: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "icon")
        return imageView
    }()
    
    private lazy var carouselCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.carouselCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.cornerRadius = 20
        collectionView.clipsToBounds = true
        return collectionView
    }()
    
    private lazy var imageCarousel: [String] = Constants.Values.carouselImage
    var timer: Timer?
    var currentCellIndex = 0
    
    private lazy var categoryLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.text = "Categories"
        return label
    }()
    
    private lazy var oilSegmentedControl: UISegmentedControl = {
       let segmentedControl = UISegmentedControl(items: ["Бензин", "Дизтопливо"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .init(red: 151/255, green: 93/255, blue: 196/255, alpha: 1)
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    private lazy var productsLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.text = "Products"
        return label
    }()
    
    private lazy var productsCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.productCollectionViewCell)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        
        carouselCollectionView.dataSource = self
        carouselCollectionView.delegate = self
        
        productsCollectionView.dataSource = self
        productsCollectionView.delegate = self

        setupViews()
        setupConstraints()
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }
    
    @objc func slideToNext() {
        if currentCellIndex < imageCarousel.count - 1 {
            currentCellIndex = currentCellIndex + 1
        } else {
            currentCellIndex = 0
        }
        carouselCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: print("Benzin")
        case 1: print("Dizel")
        default: return
        }
        
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == carouselCollectionView {
            return imageCarousel.count
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == carouselCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.carouselCollectionViewCell, for: indexPath) as! CarouselCollectionViewCell
            cell.setImage(with: imageCarousel[indexPath.row])
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.productCollectionViewCell, for: indexPath) as! ProductCollectionViewCell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        return cell
    }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == carouselCollectionView {
            let width = collectionView.frame.size.width
            let height = collectionView.frame.size.height
            return CGSize(width: width, height: height)
        }
        let width = view.frame.size.width * 0.44
        let height = view.frame.size.height * 0.3
        return CGSize(width: width, height: height)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = ProductViewController()
//        present(controller, animated: true)
        navigationController?.pushViewController(controller, animated: true)
    }
}

private extension HomeViewController {
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(wholeView)
        wholeView.addSubview(companyLogo)
        wholeView.addSubview(carouselCollectionView)
        wholeView.addSubview(categoryLabel)
        wholeView.addSubview(oilSegmentedControl)
        wholeView.addSubview(productsLabel)
        wholeView.addSubview(productsCollectionView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        wholeView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.trailing.equalTo(view).inset(15)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.height.equalTo(view).multipliedBy(2)
        }
        companyLogo.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.equalTo(view).multipliedBy(0.18)
            make.height.equalTo(65)
        }
        carouselCollectionView.snp.makeConstraints { make in
            make.top.equalTo(companyLogo.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.2)
        }
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(carouselCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
        oilSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.06)
        }
        productsLabel.snp.makeConstraints { make in
            make.top.equalTo(oilSegmentedControl.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
        productsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(productsLabel.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
