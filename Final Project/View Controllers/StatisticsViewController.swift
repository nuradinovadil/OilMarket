//
//  StatisticsViewController.swift
//  Final Project
//
//  Created by Nuradinov Adil on 13/03/23.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    private let currencySet = ["USD", "EUR", "RUB"]
    private let currencyDesc = ["Доллар США", "Евро", "Российский рубль"]
    private var currencyRate: [String] = []
    
    var currencyManager = APICaller()
    
    private lazy var currencyView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 1.6
        view.backgroundColor = .white
        view.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.4)
        return view
    }()
    
    private lazy var firstLabel: UILabel = {
       let label = UILabel()
        label.text = "Продажа"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var currencyTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CurrencyTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.currencyTableViewCell)
        tableView.isScrollEnabled = false
        tableView.layer.cornerRadius = 25
        tableView.allowsSelection = false
        return tableView
    }()
    
    private lazy var moveToHomeButton: UIButton = {
       let button = UIButton()
        button.setTitle("Прогрузить валюту", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .init(red: 30/255, green: 6/255, blue: 80/255, alpha: 1)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        return button
    }()
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        
        view.backgroundColor = .init(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Statistics"
        
        currencyTableView.dataSource = self
        currencyTableView.delegate = self
        currencyManager.delegate = self
        printRate()
        
        timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(printRate), userInfo: nil, repeats: true)
    }
    
    @objc func buttonAction() {
        DispatchQueue.main.async {
            self.currencyTableView.reloadData()
        }
    }
    
    @objc func printRate() {
        print(currencySet)
        print(currencyRate)
    }
}

extension StatisticsViewController: APICallerDelegate {
    func didUpdateCurrencyModelList(with modelList: CurrencyModel, _ currencyRunner: APICaller) {
        for currency in currencySet {
            if currency == modelList.currencyFrom {
                currencyRate.append(modelList.rateString)
            }
        }
    }
    
    func didFailWithError(with error: Error) {
        print("Following error: ", error)
    }
}

extension StatisticsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.currencyTableViewCell, for: indexPath) as! CurrencyTableViewCell
        cell.setCurrency(with: currencySet[indexPath.row], image: currencySet[indexPath.row], desc: currencyDesc[indexPath.row])
        currencyManager.fetchRequest(from: currencySet[indexPath.row])
            if !currencyRate.isEmpty {
                cell.setPrice(price: currencyRate[indexPath.row])
        }
        return cell
    }
}


extension StatisticsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(view.frame.size.height * 0.1)
    }
}

private extension StatisticsViewController {
    func setupViews() {
        view.addSubview(currencyView)
        currencyView.addSubview(currencyTableView)
        currencyView.addSubview(firstLabel)
        currencyView.addSubview(moveToHomeButton)
    }
    
    func setupConstraints() {
        currencyView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(view).multipliedBy(0.5)
        }
        firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(250)
        }
        currencyTableView.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.3)
        }
        moveToHomeButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(20)
            make.height.equalTo(view).multipliedBy(0.07)
        }
    }
}

