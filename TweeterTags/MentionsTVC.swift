//
//  MentionsTVC.swift
//  TweeterTags
//
//  Created by 罗俊豪 on 12/03/2022.
//

import UIKit

class MentionsTVC: UITableViewController {
    var tweet: TwitterTweet?
    var mention = [[String]]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        var imageURL = [String]()
        var URLs = [String]()
        var hashTags = [String]()
        var users = [String]()
        
        //put media, url, hashtag, user in each array, if they exist
        if (tweet?.media.count != 0) {
            imageURL.append("image")
            imageURL.append((tweet?.media[0].url.absoluteString)!)
        }
        
        if (tweet?.urls.count != 0) {
            URLs.append("URLs")
            for url in tweet!.urls {
                URLs.append(url.keyword)
            }
        }
        
        if (tweet?.hashtags.count != 0) {
            hashTags.append("HashTags")
            for hashTag in tweet!.hashtags {
                hashTags.append(hashTag.keyword)
            }
        }
        
        if (tweet?.userMentions.count != 0) {
            users.append("Users")
            for userMention in tweet!.userMentions {
                users.append(userMention.keyword)
            }
        }
        
        //if media, url, hashtag, user exist in tweet, append them
        if (imageURL.count != 0) {
            mention.append(imageURL)
        }
        
        if (URLs.count != 0) {
            mention.append(URLs)
        }
        
        if (hashTags.count != 0) {
            mention.append(hashTags)
        }
        
        if (users.count != 0) {
            mention.append(users)
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return mention.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return mention[section].count - 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (mention[0][0] == "image" && indexPath.section == 0) {
            return 267 //adjust height for image
        } else {
            return 42
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        //add header for each section
       return mention[section][0]
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        if (mention[0][0] == "image" && indexPath.section == 0) {
            
            let cellForImage = tableView.dequeueReusableCell(withIdentifier: "imageCell") as! imageCell
            let url = URL(string: mention[0][1])
            let data = try? Data(contentsOf: url!)
            cellForImage.mentionImage.image = UIImage(data: data!)
            
            return cellForImage
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MentionsCell", for: indexPath) as! MentionsCell
            
            cell.value.text = mention[indexPath.section][indexPath.row + 1]
            
            return cell
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue for going to TweetsTVC
        if segue.identifier == "clickMentionSegue", let destination = segue.destination as? TweetsTVC {
            if let cell = sender as? MentionsCell {
                
                destination.twitterQuery = cell.value.text
            }
        }
        
        //segue for imageVC
        if segue.identifier == "clickImageSegue", let destination = segue.destination as? ImageVC {
            if let cell = sender as? imageCell {
                
                destination.newImage = cell.mentionImage.image
                
            }
        }
    }
    
    //open safari
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(mention[indexPath.section][0] == "URLs") {
            if let url = URL(string: mention[indexPath.section][indexPath.row + 1]) {
                UIApplication.shared.open(url)
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
