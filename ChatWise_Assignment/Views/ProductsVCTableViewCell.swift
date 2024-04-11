//
//  ProductsVCTableViewCell.swift
//  ChatWise_Assignment
//
//  Created by Karan Verma on 11/04/24.
//

import UIKit
import SDWebImage

class ProductsVCTableViewCell: UITableViewCell {

    static let identifier = "ProductsTableViewCell"
    
    private let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 3
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let productNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.showsExpansionTextWhenTruncated = true
        label.numberOfLines = 2
        label.font = UIFont .systemFont(ofSize: 18, weight: .bold )
        return label
    }()
    
    private let productDescriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.showsExpansionTextWhenTruncated = true
        label.numberOfLines = 10
        label.font = UIFont .systemFont(ofSize: 16 )
        return label
    }()
    
    private func applyConstraints(){
        let productImageConstraints = [
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            productImage.widthAnchor.constraint(equalToConstant: 150)
        ]
        
        let productNameLabelConstraints = [
            productNameLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 15),
            productNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
          
        ]
        
        let productDescriptionLabelConstraints = [
            productDescriptionLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 15),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(productImageConstraints)
        NSLayoutConstraint.activate(productNameLabelConstraints)
        NSLayoutConstraint.activate(productDescriptionLabelConstraints)

        
    }
    
    public func configure( with model : ProductCellViewModel){
        guard let url = URL(string: model.url) else {return }
        DispatchQueue.main.async {
            self.productImage.sd_setImage(with: url)
            self.productNameLabel.text = model.title
            self.productDescriptionLabel.text = model.description
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productImage)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productDescriptionLabel)
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
