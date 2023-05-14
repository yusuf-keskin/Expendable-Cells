//
//  ViewController.swift
//  ExtendableTableView
//
//  Created by YUSUF KESKİN on 13.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var texts = [String]()
    
    var table : UITableView = {
        let table = UITableView()
        table.register(MyCellTableViewCell.self, forCellReuseIdentifier: MyCellTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        view.addSubview(table)
        view.backgroundColor = .white
        
        let textProvider = TextProvider()
        
        textProvider.getRandomTexts { [weak self] result in
            switch result {
            case .success(let texts):
                self?.texts = texts
                DispatchQueue.main.async {
                    self?.table.reloadData()
                }
            case .failure(_):
                print("Error occured")
            }
        }
        
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 20
    }
    


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        table.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        

    }
}


extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyCellTableViewCell.identifier) as? MyCellTableViewCell else {
         
            return UITableViewCell() }
        let data = texts[indexPath.row]
        cell.setupView(text: data)
        return cell
    }
}
