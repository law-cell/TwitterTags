//
//  TweetsTVC.swift
//  TweeterTags
//
//  Created by 罗俊豪 on 07/03/2022.
//

import UIKit

class TweetsTVC: UITableViewController, UITextFieldDelegate {
    var tweets = [TwitterTweet]()
    var twitterQuery: String? = "#ucd"
    var tweetsCount = 8
    @IBOutlet weak var twitterQueryTextField: UITextField!
    
    
    override func viewDidLoad() {
        refreshData()
        //self.tableView.reloadData()
        super.viewDidLoad()
        
        print("viewDidLoad")
        //textFieldDidChange()
        
        //when the value of textField change
        twitterQueryTextField.addTarget(self, action: #selector(textFieldDidChange), for:  .editingChanged)
        
        twitterQueryTextField.delegate = self
        twitterQueryTextField.text = twitterQuery
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //when the value of textField change
    @objc func textFieldDidChange() {
        
        print("didChange")
        print(twitterQueryTextField.text)
        twitterQuery = twitterQueryTextField.text
        refreshData()
        
        self.tableView.reloadData()
        
    }
    

    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("setNumberOfRows")
        print(tweets.count)
        if(tweets.isEmpty) {
            return 0
        } else {
            return tweets.count
        }
    }
    
    func refreshData(){
        let request = TwitterRequest(search: twitterQuery!, count: 8)
        request.fetchTweets { (tweets) -> Void in
            DispatchQueue.main.async { () -> Void in
            print("getData1", self.twitterQuery)
                print(tweets.count)
                self.tweets = tweets
                self.tableView.reloadData()
            }
            
            self.tweets = tweets
            
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        
        //self.textLabel?.text = "Query: #UCD"
        
                // check log in console
                
                
                print("loadData", indexPath.row)
                print("当前填充", twitterQuery)
                let dateArr = tweets[indexPath.row].created.formatted().components(separatedBy: ",")
                let description: String = tweets[indexPath.row].description
                let descriptionFirst: String = description.components(separatedBy: CharacterSet.newlines).first!
                let descriptionArr = descriptionFirst.components(separatedBy: "-")
                cell.tweetText.text = tweets[indexPath.row].text
                cell.tweetTitle.text = descriptionArr[0]
                cell.tweetDate.text = dateArr[1]
                let url = tweets[indexPath.row].user.profileImageURL
                let data = try? Data(contentsOf: url!)
                if (data != nil) {
                    cell.tweetImage.image = UIImage(data: data!)
                } else {
                    cell.tweetImage.image = UIImage(systemName: "paperplane.circle.fill")
                }
                
                    
                
                
                
                // update label
                //self.textLabel?.text = (self.textLabel?.text ?? "") + "\nFetched \(tweets.count) tweets"

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
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
