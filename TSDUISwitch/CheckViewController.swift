//
//  CheckViewController.swift
//  TSDUISwitch
//
//  Created by admin on 21.11.2023.
//

import UIKit

final class CheckViewController: UIViewController {
    
    // MARK: Meals to display
    
    private let orderTotal = [
        Meal(name: "Cezar Salad", cost: 450.0, ingredients: ["Chiken", "Cherry tomato", "Cheese", "Chineese Cabbage"]),
        Meal(name: "Greece Salad", cost: 600.0, ingredients: ["Cherry tomato", "Chiken", "Salad", "Cheese", "Cherry tomato", "Chiken", "Salad", "Cheese","Cherry tomato", "Chiken", "Salad", "Cheese","Cherry tomato", "Chiken", "Salad", "Cheese","Cherry tomato", "Chiken", "Salad", "Cheese","Cherry tomato", "Chiken", "Salad", "Cheese"])
    ]
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

private extension CheckViewController {
    
    // MARK: Set navigationTitle and backgroundColor to system
    
    func configureBaseUI() {
        self.title = "CheckView"
        view.backgroundColor = .systemBackground
    }
    
    func configureUI() {
        configureBaseUI()
        
        // MARK: Configure TableView
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MealCell.self, forCellReuseIdentifier: MealCell.reuseID)
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
    }
    
}

extension CheckViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orderTotal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MealCell.reuseID, for: indexPath) as? MealCell else {
            return UITableViewCell()
        }
        cell.configureCellWith(orderTotal[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
