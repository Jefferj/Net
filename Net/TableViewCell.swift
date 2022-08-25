//
//  TableViewCell.swift
//  Net
//
//  Created by Jefferson Naranjo rodríguez on 24/08/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtDesc:UILabel!
    @IBOutlet weak var nImage:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func onBind(data: MoviesModel) {
        txtName.text = data.title
        txtDesc.text = data.overview
    }
}
