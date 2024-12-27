//
//  WelcomeView.swift
//  NLW
//
//  Created by Matheus Franceschini on 15/12/24.
//

import Foundation
import UIKit

class WelcomeView: UIView {
    
    var didTapButton: (() -> Void?)?
    
    private let logoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Boas vindas ao Nearby!"
        label.font = Typography.titleXL
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tenha cupons de vantagem para usar em seus estabelecimentos favoritos."
        label.font = Typography.textMD
        label.numberOfLines = 0
        return label
    }()
    
    private let subTextForTips: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Veja como funciona:"
        label.font = Typography.textMD
        return label
    }()
    
    private let tipsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        stackView.axis = .vertical
        return stackView
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar", for: .normal)
        button.backgroundColor = Colors.greenBase
        button.setTitleColor(Colors.gray100, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = Typography.action
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupTips()
        addSubview(logoImageView)
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
        addSubview(subTextForTips)
        addSubview(tipsStackView)
        addSubview(startButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            subTextForTips.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            subTextForTips.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            tipsStackView.topAnchor.constraint(equalTo: subTextForTips.bottomAnchor, constant: 24),
            tipsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            tipsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            startButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc private func didTap() {
        didTapButton?()
    }
    
    private func setupTips() {
        let tip1 = TipsView(icon: UIImage(named: "mapIcon") ?? UIImage(), 
                            title: "Encontre estabelecimentos",
                            description: "Veja locais perto de você que são parceiros do Nearby")
        
        let tip2 = TipsView(icon: UIImage(named: "qrcode") ?? UIImage(),
                            title: "Ative o cupom com QR Code",
                            description: "Escaneie o código no estabelecimento para usar o benefício")
        
        let tip3 = TipsView(icon: UIImage(named: "ticket") ?? UIImage(),
                            title: "Garanta vantagens perto de você",
                            description: "Ative cupons onde estiver, em diferentes tipos de estabelecimento")
        
        tipsStackView.addArrangedSubview(tip1)
        tipsStackView.addArrangedSubview(tip2)
        tipsStackView.addArrangedSubview(tip3)
    }
}
