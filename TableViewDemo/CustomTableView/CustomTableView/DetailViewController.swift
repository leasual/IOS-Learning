//
//  DetailViewController.swift
//  CustomTableView
//
//  Created by leasual on 16/3/2.
//  Copyright © 2016年 wesoft. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class DetailViewController: UIViewController {
    
    @IBOutlet weak var videoDetail: UILabel!
    @IBOutlet weak var videoView: YTPlayerView!

    var workout: Workout?
    var videoId: String?
    let playerVars = ["playsinline":"1","showinfo":"0","autohide":"1"]
    
    
    @IBAction func backAction(sender: AnyObject) {
        print("back item click")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup(){
    
        self.view.backgroundColor = workout?.color
        self.videoDetail.text = workout?.workoutText
        self.title = workout?.title
        self.navigationController?.navigationBar.barTintColor = workout?.color
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.videoView.loadWithVideoId(self.workout?.videoId, playerVars: self.playerVars)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
