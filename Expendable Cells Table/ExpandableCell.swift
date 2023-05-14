//
//  MyCellTableViewCell.swift
//  ExtendableTableView
//
//  Created by YUSUF KESKİN on 13.05.2023.
//

import UIKit

class ExpandableCell: UITableViewCell {
    
    static let identifier = "Cell"
    
    var label : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 12)
        label.textColor =  .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hey"
        return label
    }()
    
    var btn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Clik Me", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .gray
        return btn
    }()
    
    override func awakeFromNib() {
        self.contentView.sizeToFit()
        super.awakeFromNib()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
//        contentView.addSubview(btn)
    }
    
    func setupView(text: String){
        DispatchQueue.main.async {
            self.label.text = text
            print(text)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        
        label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        label.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5).isActive = true
        label.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5).isActive = true
        label.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5).isActive = true
        label.heightAnchor.constraint(greaterThanOrEqualToConstant: 10).isActive = true
        label.numberOfLines = 0
        label.sizeToFit()

//        btn.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20).isActive = true
//        btn.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
//        btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
}
