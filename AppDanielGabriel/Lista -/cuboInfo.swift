import UIKit

class PersonCell: UITableViewCell {
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    
    private let PersonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .equalCentering
        return stack
    }()
    
    private let nomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let status: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
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
        //PersonImageView.download(from: persons.imgUrl)
    }
    
    private func setupView() {
        selectionStyle = .none
    }
    
    private func addViewsInHierarchy() {
        contentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(PersonImageView)
        horizontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(UIView())
        verticalStack.addArrangedSubview(nomeLabel)
        verticalStack.addArrangedSubview(status)
        verticalStack.addArrangedSubview(UIView())
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            PersonImageView.widthAnchor.constraint(equalToConstant: 90),
            PersonImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}
