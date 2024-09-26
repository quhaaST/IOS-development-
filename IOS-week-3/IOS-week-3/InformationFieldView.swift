//
//  InformationFieldView.swift
//  IOS-week-3
//
//  Created by Aleksandr Evdokimov on 04.10.2023.
//

import UIKit

class InformationFieldView: UIView {
    
    private let imageView: UIImageView = UIImageView()
    private let nameLabel: UILabel = UILabel()
    private let educationLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    func configure(data: PersonalInformationModel) {
        nameLabel.text = data.name
        educationLabel.text = data.education
    }
    
    private func setupViews() {
        backgroundColor = .cyan
        layer.cornerRadius = 24
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "smol_frog.png")
        imageView.contentMode = .scaleAspectFit
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.text = "Name"
        
        educationLabel.translatesAutoresizingMaskIntoConstraints = false
        educationLabel.lineBreakMode = .byTruncatingTail
        educationLabel.font = .systemFont(ofSize: 14)
        educationLabel.text = "Education"
        
        layer.cornerRadius = 24
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(educationLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 24),
            
            educationLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            educationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            educationLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -24),
        ])
    }
}
