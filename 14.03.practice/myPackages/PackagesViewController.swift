

import UIKit
enum MytemModel {
    case model(MyPackagesCell.MyItem)
}
class PackagesViewController:UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    var modelsList:[MytemModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyPackagesCell.nib, forCellReuseIdentifier: MyPackagesCell.identifier)
        loadJSON()
    }
    func loadJSON() {
        if let url = Bundle.main.url(forResource: "datalar", withExtension: "json") {
                    do {
                        let data = try Data(contentsOf: url)
                        let decodedData = try JSONDecoder().decode(Model.self, from: data)
                        
                        modelsList = decodedData.model.map { .model($0) }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print("JSON error: \(error)")
            }
        }
    }
    
    
    @IBAction func continueButton(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "") as? _ {
//            self.present(nextViewController, animated: true)
//        }
    }
}

extension PackagesViewController :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = modelsList[indexPath.row]
        switch cellType {
        case .model(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPackagesCell.identifier, for: indexPath) as? MyPackagesCell else {
                return UITableViewCell()
            }
            cell.configure(item: model)
            return cell
        }
    }
}

    
