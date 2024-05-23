//
//  ViewController.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 15/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var viewModel: TableViewViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Dependency Injection
        let apiService = ApiService()
        viewModel = TableViewViewModel(apiService: apiService)
        
        self.reloadTableView()
        self.navigateToSelectedPreson()
        self.navigationItem.title = "Products"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchProductsData()
    }
    
    func hocLearning() {
//        var strArray = ["S1","S2","S3",nil,nil]
//        strArray = strArray.compactMap { array in
//            return array != nil
//        }
//        print(strArray)
    }
    
    func  reloadTableView() {
        viewModel.updateViewWithData = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func navigateToSelectedPreson() {
        print("navigateToSelectedPreson")
        viewModel.onSelectedProduct = { [weak self] product in
            let detailViewModel = DetailViewModel(product: product)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
                detailViewController.detailViewModel = detailViewModel
                self?.navigationController?.pushViewController(detailViewController, animated: true)
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tableViewCellViewModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as? CustomTableViewCell else { return UITableViewCell()
        }
        let productInfo = viewModel.tableViewCellViewModelArray[indexPath.row]
        tableViewCell.configureCell(tableViewCellViewModel: productInfo)
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectProduct(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

