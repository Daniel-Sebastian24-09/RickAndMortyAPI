import UIKit

class PersonCell: UITableViewCell {
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.backgroundColor = .init(displayP3Red: 0.213, green: 0.207, blue: 0.192, alpha: 0.4)
        stack.layer.cornerRadius = 10
        stack.layer.masksToBounds = true
        return stack
    }()
    
    private let PersonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let portalFundo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .equalCentering
        return stack
    }()
    
    private let verticalInfo: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .equalCentering
        stack.backgroundColor = .brown
        stack.layer.cornerRadius = 10
        stack.layer.masksToBounds = true
        return stack
    }()
    
    private let nomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let status: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        addViewsInHierarchy()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    public func setup(persons: Person) {
        nomeLabel.text = persons.name
        status.text = "status: \(persons.status)"
        PersonImageView.download(from: persons.image)
        portalFundo.download(from: "https://i.pinimg.com/originals/98/29/21/9829215db6f9210c0ae4e318e854cb1f.png")
    }
    
    private func setupView() {
        selectionStyle = .none
    }
    
    private func addViewsInHierarchy() {
        contentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(portalFundo)
        portalFundo.addSubview(PersonImageView)
        horizontalStack.addArrangedSubview(verticalStack)
        horizontalStack.addArrangedSubview(UIView())
        verticalStack.addArrangedSubview(UIView())
        verticalStack.addArrangedSubview(verticalInfo)
        verticalStack.addArrangedSubview(UIView())
        verticalInfo.addArrangedSubview(nomeLabel)
        verticalInfo.addArrangedSubview(status)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            portalFundo.widthAnchor.constraint(equalToConstant: 150),
            portalFundo.heightAnchor.constraint(equalToConstant: 150),
            PersonImageView.widthAnchor.constraint(equalToConstant: 100),
            PersonImageView.heightAnchor.constraint(equalToConstant: 100),
            PersonImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 55),
            PersonImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 55),
            verticalInfo.widthAnchor.constraint(equalToConstant: 140),
        ])
    }
}
