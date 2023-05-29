//
//  ProfileViewController.swift
//  Final Project
//
//  Created by Nuradinov Adil on 13/03/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let wholeView = UIView()
    private let scrollView = UIScrollView()
    
    private lazy var accountImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "userImage")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "Nuradinov Adil"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private lazy var settingsTableView:UITableView = {
       let tabelView = UITableView()
        tabelView.register(SettingsTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.settingsTableViewCell)
        tabelView.layer.cornerRadius = 20
        tabelView.clipsToBounds = true
        tabelView.isScrollEnabled = false
        return tabelView
    }()
    
    private lazy var contactUsTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(ContactUsTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.contactUsTableViewCell)
        tableView.layer.cornerRadius = 20
        tableView.clipsToBounds = true
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    private lazy var exitButton: UIButton = {
       let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.backgroundColor = .white
        button.setTitle("Sign Out", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Account"
        
        setupViews()
        setupConstraints()
        
        
        
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        
        contactUsTableView.dataSource = self
        contactUsTableView.delegate = self
    }
    
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == settingsTableView {
            return 4
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == settingsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.settingsTableViewCell, for: indexPath) as! SettingsTableViewCell
            cell.configureNameAndImage(text: Profile.allCases[indexPath.row].rawValue, image: ProfieImages.allCases[indexPath.row].rawValue)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.contactUsTableViewCell, for: indexPath) as! ContactUsTableViewCell
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(view.frame.size.height) * 0.075
    }
}

private extension ProfileViewController {
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(wholeView)
        wholeView.addSubview(accountImageView)
        wholeView.addSubview(usernameLabel)
        wholeView.addSubview(settingsTableView)
        wholeView.addSubview(contactUsTableView)
        wholeView.addSubview(exitButton)
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
            make.height.equalTo(view).multipliedBy(0.8)
        }
        accountImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.2)
        }
        usernameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(accountImageView).offset(15)
        }
        settingsTableView.snp.makeConstraints { make in
            make.top.equalTo(accountImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.3)
        }
        contactUsTableView.snp.makeConstraints { make in
            make.top.equalTo(settingsTableView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.15)
        }
        exitButton.snp.makeConstraints { make in
            make.top.equalTo(contactUsTableView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.075)
        }
    }
}
