//
//  AlbumInfoTableCell.swift
//  TechInterviewProject
//
//  Created by KirtisOrendorff on 10/17/18.
//  Copyright © 2018 KirtisOrendorff. All rights reserved.
//

import UIKit

class AlbumInfoTableCell: UITableViewCell {
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
