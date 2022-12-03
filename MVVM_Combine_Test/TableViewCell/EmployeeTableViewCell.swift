//
//  EmployeeTableViewCell.swift
//  MVVM_Combine_Test
//
//  Created by kurupareshan pathmanathan on 11/26/22.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var employee : EmployeesData? {
        didSet {
//            let x : Int = employee!.id
//            idLabel.text = String(x)
//            nameLabel.text = employee?.employeeName
        }
    }
    
    func setupView(login: String, id: Int) {
        nameLabel.text = login
        idLabel.text = String(id)
        print("login is", login)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
