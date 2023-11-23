//
//  MealCell.swift
//  TSDUISwitch
//
//  Created by admin on 22.11.2023.
//

import UIKit

final class MealCell: UITableViewCell {
    
    // MARK: Private properties
    
    static var reuseID: String {
        return String(describing: Self.self)
    }
    
    // MARK: UIElemetns
    
    private let nameLabel = UILabel()
    private let costLabel = UILabel()
    private let ingredientsLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let colors: [UIColor] = [UIColor.systemRed, UIColor.systemYellow, UIColor.systemCyan, UIColor.systemMint, UIColor.systemPink]
        let randomColor = colors.randomElement()
        
        contentView.backgroundColor = randomColor
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        // MARK: Configure Name Label
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(8)
        }
        
        // MARK: Configure Cost Label
        
        contentView.addSubview(costLabel)
        costLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(8)
        }
        
        // MARK: Configure Ingredients Label
        
        ingredientsLabel.numberOfLines = 0
        contentView.addSubview(ingredientsLabel)
        ingredientsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.bottom.equalToSuperview().inset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCellWith(_ meal: Meal) {
        nameLabel.text = meal.name
        costLabel.text = String(meal.cost)
        ingredientsLabel.text = "Meals: "
        
        meal.ingredients.forEach { ing in
            ingredientsLabel.text? += "\(ing),"
        }
        ingredientsLabel.text?.removeLast()
    }
}
