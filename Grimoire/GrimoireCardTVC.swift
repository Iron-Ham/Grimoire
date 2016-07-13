//
//  GrimoireCardTVC.swift
//  Grimoire
//
//  Created by Hesham Salman on 7/12/16.
//

import Foundation
import UIKit

class GrimoireCardTVC: UITableViewController {

    var grimoirePages = [GrimoirePage]()
    let grimoireManager = GrimoireManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 250
        loadGrimoires()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    func loadGrimoires() {
        self.grimoireManager.fetchGrimoireCards { (success, grimoirePages) in
            if let grimoirePages = grimoirePages where success {
                self.grimoirePages = grimoirePages
                self.tableView.reloadData()
            }
        }
    }

    //MARK: UITableViewDelegate

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let page = grimoirePages[section]
        return page.pageName
    }

    //MARK: UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return grimoirePages.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grimoirePages[section].grimoireCards.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GrimoireCardCell", forIndexPath: indexPath) as! GrimoireCardCell
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }

    func configureCell(cell: GrimoireCardCell, forRowAtIndexPath: NSIndexPath) {
        let grimoireCard = grimoirePages[forRowAtIndexPath.section].grimoireCards[forRowAtIndexPath.row]
        cell.cardAttributionLabel.text = grimoireCard.cardIntroAttribution
        cell.cardDescriptionLabel.text = grimoireCard.cardDescription
        cell.cardIntroLabel.text = grimoireCard.cardIntro
        cell.cardNameLabel.text = grimoireCard.cardName
        cell.cardUnlockLabel.text = grimoireCard.unlockHowToText
        cell.pointsLabel.text = "\(grimoireCard.points) Points"
        configureCellImage(cell, grimoireCard: grimoireCard)
        cell.selectionStyle = .None
    }

    func configureCellImage(cell: GrimoireCardCell, grimoireCard: GrimoireCard) {
        if let grimoireImage = grimoireCard.highResolutionImage,
            let grimoireURL = NSURL(string: APIClient.basePath + grimoireImage.path) {
            grimoireManager.client.fetchData(grimoireURL) { (result) in
                switch result {
                case .Success(let data):
                    cell.grimoireImageView.image = UIImage(data: data)
                default: break
                }
            }
        }
    }
}
