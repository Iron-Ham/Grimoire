//
//  GrimoireCardCell.swift
//  Grimoire
//
//  Created by Hesham Salman on 7/12/16.
//

import Foundation
import UIKit

class GrimoireCardCell: UITableViewCell {
    @IBOutlet weak var grimoireImageView: UIImageView!
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var cardIntroLabel: UILabel!
    @IBOutlet weak var cardAttributionLabel: UILabel!
    @IBOutlet weak var cardDescriptionLabel: UILabel!
    @IBOutlet weak var cardUnlockLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        self.grimoireImageView.image = nil
    }

}
