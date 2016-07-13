//
//  GrimoireSectionHeader.swift
//  Grimoire
//
//  Created by Hesham Salman on 7/12/16.
//

import Foundation
import UIKit

class GrimoireSectionHeader: UIView {
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var sectionNameLabel: UILabel!
    @IBOutlet var view: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        NSBundle.mainBundle().loadNibNamed("GrimoireSectionHeader", owner: self, options: nil)
        constrainSubviewCreatedFromNib()
    }

    private func constrainSubviewCreatedFromNib() {
        addSubview(view)

        let views = ["contentView": view]
        view.translatesAutoresizingMaskIntoConstraints = false

        var c = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(0)-[contentView]-(0)-|",
            options: [],
            metrics: nil,
            views: views
        )

        c += NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(0)-[contentView]-(0)-|",
            options: [],
            metrics: nil,
            views: views
        )

        self.addConstraints(c)
    }
}
