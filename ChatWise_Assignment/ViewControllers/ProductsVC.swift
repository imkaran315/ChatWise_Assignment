//
//  ProductsVC.swift
//  ChatWise_Assignment
//
//  Created by Karan Verma on 11/04/24.
//

import UIKit
import Alamofire

class ProductsVC: UIViewController {
    
    private let productsTable : UITableView = {
        
        let table = UITableView()
        table.tintColor = .black
        table.register(ProductsVCTableViewCell.self, forCellReuseIdentifier: ProductsVCTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Products"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(productsTable)
        
        productsTable.delegate = self
        productsTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productsTable.frame = view.bounds
    }

}

extension ProductsVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductsVCTableViewCell.identifier, for: indexPath) as? ProductsVCTableViewCell else{
            return UITableViewCell()
        }
        
        // calling function to fetch results from API and configure the cell with results.
        performRequest { results in
            switch results{
                // when results are valid
            case.success(let success):
                let title = success.products[indexPath.row].title
                let description = success.products[indexPath.row].description
                let url = success.products[indexPath.row].thumbnail
                cell.configure(with: ProductCellViewModel(title: title, description: description, url: url))
                
                // when results give error
            case .failure(_):
                print("error in performRequest")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
}
