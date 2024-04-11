//
//  ViewController.swift
//  ChatWise_Assignment
//
//  Created by Karan Verma on 11/04/24.
//

import UIKit

class HomeVC: UIViewController {

    // Making a button
    let ProductsButton : UIButton = {
        let button = UIButton()
        button.setTitle("Products Page", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
       
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(ProductsButton)
        ProductsButton.addTarget(self, action: #selector(didTapButton), for: .touchDown)
    }
    
    // Laying out the button
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ProductsButton.frame = CGRect(x: view.frame.width/2 - 75, y: (view.frame.height/2) - 25, width: 150, height: 50)
    }

    
    @objc func didTapButton(){
        let vc = ProductsVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}

