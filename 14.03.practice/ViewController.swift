//
//  ViewController.swift
//  14.03.practice
//
//  Created by User on 14.03.25.
//

import UIKit

enum ItemModel {
    case package(PackageTableViewCell.PackageItem)
}

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var modelsList:[ItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PackageTableViewCell.nib, forCellReuseIdentifier: PackageTableViewCell.identifier)
        loadJSON()
    }
  
       
    func loadJSON() {
        if let url = Bundle.main.url(forResource: "datalar", withExtension: "json") {
                    do {
                        let data = try Data(contentsOf: url)
                        let decodedData = try JSONDecoder().decode(Model.self, from: data)
                        
                        modelsList = decodedData.packages.map { .package($0) }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print("JSON error: \(error)")
            }
        }
    }
}

  extension ViewController:  UITableViewDataSource, UITableViewDelegate, Delegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = modelsList[indexPath.row]
        switch cellType {
        case .package(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PackageTableViewCell.identifier, for: indexPath) as? PackageTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(item: model)
            cell.delegate = self
            return cell
            
        }
    }
    
    func didTapButton(item: PackageTableViewCell.PackageItem) {
        if let vc = storyboard?.instantiateViewController(identifier:EconomViewController.identifier) as? EconomViewController {
            print("salam")
            present(vc, animated: true)
        }
    }
}



