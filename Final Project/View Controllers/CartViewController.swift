//
//  CartViewController.swift
//  Final Project
//
//  Created by Nuradinov Adil on 13/03/23.
//

import UIKit

class CartViewController: UIViewController {
    
    private var wholeView = UIView()
    
    private lazy var cartTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.cartTableViewCell)
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Cart"
        setupViews()
        setupConstraints()
        
        cartTableView.dataSource = self
        cartTableView.delegate = self
        
    }
}

extension CartViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.cartTableViewCell, for: indexPath) as! CartTableViewCell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(view.frame.size.height * 0.0005)
    }
}

extension CartViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(view.frame.size.height * 0.135)
    }
}

private extension CartViewController {
    func setupViews() {
        view.addSubview(wholeView)
        wholeView.addSubview(cartTableView)
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        cartTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
