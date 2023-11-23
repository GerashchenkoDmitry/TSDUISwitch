//
//  SettingsViewController.swift
//  TSDUISwitch
//
//  Created by admin on 30.10.2023.
//

import UIKit
import SwiftUI
import SnapKit

final class SettingsViewController: UIViewController {
    
    // MARK: Private Properties
    
    private let nameLabel = UILabel()
    private let nameTextField = TextFieldWithPadding()
    
    private let guestsLabel = UILabel()
    private let guestsTextField = TextFieldWithPadding()
    
    private let tableNumberLabel = UILabel()
    private let tableTextField = TextFieldWithPadding()
    
    private let reserveLabel = UILabel()
    private let reserveSwitch = UISwitch()
    
    private let prepayLabel = UILabel()
    private let prepaySwitch = UISwitch()
    
    private let privateRoomLabel = UILabel()
    private let privateRoomSwitch = UISwitch()
    
    private let checkOrderButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        hideKeyboardOnTap()
    }
}

// MARK: SettingsViewController Extension

private extension SettingsViewController {
    
    // MARK: Configure Base User Interface
    
    func configurebaseUI() {
        self.title = "Reservation"
        view.backgroundColor = .systemBackground
    }
    
    // MARK: Initialize Interface function
    
    func initialize() {
        
        // MARK: Call configureBaseUI function
        
        configurebaseUI()
        
        // MARK: Init Name Label
        nameLabel.text = "Name"
        nameLabel.textColor = .systemPink
        
        nameLabel.contentMode = .center
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.addSubview(nameLabel)
        
        guard let navBarFrameSize = navigationController?.navigationBar.frame.height else { return }
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(40)
            make.top.equalToSuperview().inset(navBarFrameSize + 100)
        }
        
        // MARK: Name UITextField
        
        nameTextField.keyboardType = .default
        nameTextField.clearButtonMode = .whileEditing
        nameTextField.returnKeyType = .done
        nameTextField.layer.cornerRadius = 8
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.borderColor = UIColor.systemRed.cgColor
        
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(40)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.height.equalTo(36)
        }
        nameTextField.addTarget(self, action: #selector(textFieldDidEndEditing(sender: )), for: .editingDidEndOnExit)
        
        // MARK: Number of Guests Label
        
        guestsLabel.text = "Guests"
        guestsLabel.textColor = .systemPink
        
        guestsLabel.contentMode = .center
        guestsLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.addSubview(guestsLabel)
        
        guestsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(40)
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
        }
        
        // MARK: Guests number TextField
        
        guestsTextField.keyboardType = .numberPad
        guestsTextField.clearButtonMode = .whileEditing
        guestsTextField.isSecureTextEntry = false
        guestsTextField.returnKeyType = .done
        guestsTextField.layer.cornerRadius = 8
        guestsTextField.layer.borderWidth = 2
        guestsTextField.layer.borderColor = UIColor.systemPink.cgColor
        guestsTextField.addTarget(self, action: #selector(textFieldDidEndEditing(sender: )), for: .editingDidEndOnExit)
        
        view.addSubview(guestsTextField)
        guestsTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(40)
            make.top.equalTo(guestsLabel.snp.bottom).offset(5)
            make.height.equalTo(36)
        }
        
        // MARK: Number of Table Label
        
        tableNumberLabel.text = "Table"
        tableNumberLabel.textColor = .systemPink
        
        tableNumberLabel.contentMode = .center
        tableNumberLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.addSubview(tableNumberLabel)
        
        tableNumberLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(40)
            make.top.equalTo(guestsTextField.snp.bottom).offset(20)
        }
        
        // MARK: Guests number TextField
        
        tableTextField.keyboardType = .numberPad
        tableTextField.clearButtonMode = .whileEditing
        tableTextField.isSecureTextEntry = false
        tableTextField.returnKeyType = .done
        tableTextField.layer.cornerRadius = 8
        tableTextField.layer.borderWidth = 2
        tableTextField.layer.borderColor = UIColor.systemPink.cgColor
        tableTextField.addTarget(self, action: #selector(textFieldDidEndEditing(sender: )), for: .editingDidEndOnExit)
        
        view.addSubview(tableTextField)
        tableTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(40)
            make.top.equalTo(tableNumberLabel.snp.bottom).offset(5)
            make.height.equalTo(36)
        }
        
        // MARK: Reserve Label
        
        reserveLabel.text = "Do you reserve a table?"
        
        reserveLabel.contentMode = .center
        reserveLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.addSubview(reserveLabel)
        
        reserveLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(60)
            make.top.equalTo(tableTextField.snp.bottom).offset(50)
        }
        
        // MARK: Reserve UISwitch
        
        reserveSwitch.isOn = false
        view.addSubview(reserveSwitch)
        reserveSwitch.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(60)
            make.centerY.equalTo(reserveLabel.snp.centerY)
        }
        
        // MARK: Prepay Label
        
        prepayLabel.text = "Any prepay?"
        
        prepayLabel.contentMode = .center
        prepayLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.addSubview(prepayLabel)
        
        prepayLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(60)
            make.top.equalTo(reserveLabel.snp.bottom).offset(50)
        }
        
        // MARK: Prepay UISwitch
        
        prepaySwitch.isOn = false
        view.addSubview(prepaySwitch)
        prepaySwitch.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(60)
            make.centerY.equalTo(prepayLabel.snp.centerY)
        }
        
        // MARK: Configure private Room Label
        
        privateRoomLabel.text = "Want separate space?"
        
        privateRoomLabel.contentMode = .center
        privateRoomLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.addSubview(privateRoomLabel)
        
        privateRoomLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(60)
            make.top.equalTo(prepayLabel.snp.bottom).offset(50)
        }
        
        // MARK: Configure Private Room Switch
        
        privateRoomSwitch.isOn = false
        view.addSubview(privateRoomSwitch)
        privateRoomSwitch.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(60)
            make.centerY.equalTo(privateRoomLabel.snp.centerY)
        }
        
        // MARK: Configure Order Button
        
        checkOrderButton.setTitle("Order", for: .normal)
        checkOrderButton.backgroundColor = .systemPink
        checkOrderButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        checkOrderButton.layer.cornerRadius = 16
        checkOrderButton.addTarget(self, action: #selector(checkOrderButtonTapped(sender:)), for: .touchUpInside)
        view.addSubview(checkOrderButton)
        checkOrderButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(60)
            make.height.equalTo(60)
            make.top.equalTo(privateRoomLabel.snp.bottom).offset(50)
        }
    }
    
    @objc private func reserveSwitchChanged(sender:UISwitch) {
        printContent("Table in reserve")
    }
    
    @objc private func checkOrderButtonTapped(sender: UIButton) {
        let alertController = UIAlertController(title: "Order Table", message: "Are you shure?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {_ in
            let checkViewController = CheckViewController()
            self.navigationController?.pushViewController(checkViewController, animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
}
#if DEBUG

struct InfoVCRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // leave this empty
    }
    
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        SettingsViewController()
    }
}

@available(iOS 13.0, *)
struct InfoVCPreview: PreviewProvider {
    static var previews: some View {
        InfoVCRepresentable()
    }
}
#endif
