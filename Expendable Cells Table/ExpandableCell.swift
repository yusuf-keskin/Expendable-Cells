//
//  MyCellTableViewCell.swift
//  ExtendableTableView
//
//  Created by YUSUF KESKİN on 13.05.2023.
//

import UIKit

class ExpandableCell: UITableViewCell {
    
    static let identifier = "Cell"
    
    var cellHeightChanged: (()->())?
    
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4)
        return stackView
    }()
    
    let horizontalStack : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        //stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        return stackView
    }()
     
    var label : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 18)
        label.textColor =  .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hey"
        label.isHidden = true
        return label
    }()
    
    var headerLbl : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 18)
        label.textColor =  .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorep Ipsum"
        return label
    }()
    
    var btn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Clik Me", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Avenir", size: 18)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .gray
        btn.addTarget(nil, action: #selector(toggle), for: .touchUpInside)
        return btn
    }()
    
    override func awakeFromNib() {
        self.contentView.sizeToFit()
        super.awakeFromNib()
        
    }
    
    @objc func toggle(){
        DispatchQueue.main.async {
            if self.label.isHidden {
                self.label.isHidden = false
            } else {
                self.label.isHidden = true
            }
        }
        cellHeightChanged?()
    }
    

    
    func addSubviews(){
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(horizontalStack)
        horizontalStack.addArrangedSubview(headerLbl)
        horizontalStack.addArrangedSubview(btn)
        stackView.addArrangedSubview(label)
    }
    
    func setConstraints(){
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        btn.layer.cornerRadius = 7

        headerLbl.numberOfLines = 0
        headerLbl.sizeToFit()

        label.sizeToFit()
        label.numberOfLines = 0
        label.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -12).isActive = true
        label.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 12).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubviews()
        setConstraints()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
        reloadInputViews()
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
        setConstraints()
    }
    
    func setupView(text: String){
        DispatchQueue.main.async {
            self.label.text = text
            print(text)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        

        
    }
    
}
