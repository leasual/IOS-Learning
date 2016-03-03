//
//  ViewController.swift
//  CustomTableView
//
//  Created by leasual on 16/3/2.
//  Copyright © 2016年 wesoft. All rights reserved.
//

import UIKit
import ChameleonFramework


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var videoId: String?
    let data = [
        Workout(title: "Jumping Jacks", videoId: "UpH7rm0cYbM", workoutText: "A calisthenic jump done from a standing position with legs together and arms at the sides to a position with the legs apart and the arms over the head.",color:  UIColor.flatRedColor()),
        
        Workout(title: "Wall Sits", videoId: "y-wV4Venusw", workoutText: "A wall sit, also known as a Roman Chair, is an exercise done to strengthen the quadriceps muscles. It is characterized by the two right angles formed by the body, one at the hips and one at the knees.", color: UIColor.flatTealColor()),
        
        Workout(title: "Abdominal Crunches", videoId: "2yOFvV-NSeY", workoutText: "A crunch begins with lying face up on the floor with knees bent. The movement begins by curling the shoulders towards the pelvis. The hands can be behind or beside the neck or crossed over the chest. Injury can be caused by pushing against the head or neck with hands.", color: UIColor.flatPurpleColor()),
        
        Workout(title: "Push Ups", videoId: "Eh00_rniF8E", workoutText: "An exercise in which a person lies facing the floor and, keeping their back straight, raises their body by pressing down on their hands.", color: UIColor.flatBlueColor()),
        
        Workout(title: "Step-ups onto a chair", videoId: "kM2FfDIwsao", workoutText: "To do a step-up, position your chair in front of your body. Stand with your feet about hip-width apart, arms at your sides. Step up onto the seat with one foot, pressing down while bringing your other foot up next to it. ", color: UIColor.flatGreenColor()),
        
        Workout(title: "Squats", videoId: "mGvzVjuY8SY", workoutText: "Crouch or sit with one's knees bent and one's heels close to or touching one's buttocks or the back of one's thighs.", color: UIColor.flatNavyBlueColor()),
        
        Workout(title: "Triceps dips on a chair", videoId: "0326dy_-CzM", workoutText: "Triceps dips on a chair", color: UIColor.flatWatermelonColor())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
    
    func setup(){
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        appTitle.textColor = UIColor.flatWhiteColor()
        
        self.view.backgroundColor = UIColor.flatYellowColorDark()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("workoutCell", forIndexPath: indexPath) as! WorkoutCellTableViewCell
        let workout = self.data[indexPath.row]
        cell.textCell.text = workout.title
        cell.backgroundColor = workout.color
        cell.countCell.text = "\(indexPath.row+1)"
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        self.videoId = workout.videoId
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailView" {
            let cell = sender as? WorkoutCellTableViewCell
            let indexPath = tableView.indexPathForCell(cell!)
            let nvc = segue.destinationViewController as? UINavigationController
            if let tmp = data[(indexPath?.row)!] as? Workout {
                let dvc = nvc?.topViewController as? DetailViewController
                dvc?.workout = tmp
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.contentInset = UIEdgeInsetsMake(0,0,55,0)
    }

}

