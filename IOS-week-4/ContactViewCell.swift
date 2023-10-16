import UIKit
import Foundation

class ContactViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var nameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        nameLabel = UILabel()
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
    }
    
    private func setupViews() {
        backgroundColor = .lightGray
        layer.cornerRadius = 12
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ic_profile.svg")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 16)
        nameLabel.textColor = .white
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        
        setupContraints()
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([            
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
        ])
    }
}
