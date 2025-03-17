//
//  EconomViewController.swift
//  14.03.practice
//
//  Created by User on 14.03.25.
//

import UIKit
enum ItemModelEconom{
    case econom(EconomTableViewCell.EconomItem)
    
}
class EconomViewController :UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var modelsList:[ItemModelEconom] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EconomTableViewCell.nib, forCellReuseIdentifier: EconomTableViewCell.identifier)
        loadJSON()
        
    }
    
    func loadJSON() {
        if let url = Bundle.main.url(forResource: "datalar", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode(Model.self, from: data)
                
                modelsList = decodedData.economs.map { .econom($0) }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("JSON error: \(error)")
            }
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "PackagesViewController") as? PackagesViewController {
            self.present(nextViewController, animated: true)
        }
    }
}

extension EconomViewController:  UITableViewDataSource, UITableViewDelegate {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return modelsList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cellType = modelsList[indexPath.row]
      switch cellType {
      case .econom(let model):
          guard let cell = tableView.dequeueReusableCell(withIdentifier: EconomTableViewCell.identifier, for: indexPath) as? EconomTableViewCell else {
              return UITableViewCell()
          }
          cell.configure(item: model)
          return cell
          
      }
  }
}

