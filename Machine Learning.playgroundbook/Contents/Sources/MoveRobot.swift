//#-hidden-code
// Present Robot

import PlaygroundSupport
import UIKit
import AVFoundation


public class MoveRobot {
    var audioPlayer = AVAudioPlayer()
    var clapsAudioPlayer  = AVAudioPlayer()
    
    public init(){
        let talkingSoundPath = Bundle.main.path(forResource: "talking", ofType: "mp3")
        let talkingSoundUrl = URL(fileURLWithPath: talkingSoundPath!)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: talkingSoundUrl)
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.volume = 1.0
        } catch {
            print(error)
        }
        
        
        let clapsSoundPath = Bundle.main.path(forResource: "claps", ofType: "mp3")
        let clapsSoundUrl = URL(fileURLWithPath: clapsSoundPath!)
        do {
            self.clapsAudioPlayer = try AVAudioPlayer(contentsOf: clapsSoundUrl)
            self.clapsAudioPlayer.prepareToPlay()
            self.clapsAudioPlayer.volume = 1.0
        } catch {
            print(error)
        }
    }
    
    // presenting MLRobot in live view
    public func presentRobot(){
        //initialising live view
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 512, height: 1024))
        view.backgroundColor = UIColor.white
        
        
        let talkingSoundPath = Bundle.main.path(forResource: "talking", ofType: "mp3")
        let talkingSoundUrl = URL(fileURLWithPath: talkingSoundPath!)
        
        // initialising mlRobotImageView as UIImageView
        let mlRobotImageView = UIImageView(frame: CGRect(x: 512, y: 100, width: 225, height: 375))
        mlRobotImageView.image = UIImage(named : "mlrobot.png")
        view.addSubview(mlRobotImageView)
        
        // Initialising textLabel as UILabel
        let textLabel = UILabel(frame: CGRect(x:56, y: 500, width: 400, height: 100))
        textLabel.text = "Hello Reader, I am Sahil! \n\nLets begin our journey and Find what Machine Learning is!"
        textLabel.font = UIFont.systemFont(ofSize: 20)
        textLabel.numberOfLines = 0
        textLabel.alpha = 0.0
        textLabel.textAlignment = .center
        view.addSubview(textLabel)
        
        UIView.animate(withDuration: 1.0, animations: {
            //changing horizontal position of mlRobotImageView to center of view
            mlRobotImageView.center.x = view.center.x

        }) { (true) in
            mlRobotImageView.center.x = view.center.x
            
            UIView.animate(withDuration: 0.5, animations: {
                //changing alpha of textLabel from 0.0 to 1.0
                textLabel.alpha = 1.0
                self.audioPlayer.play()
                
                //showing success alert
                PlaygroundPage.current.assessmentStatus = .pass(message: "Lets begin our journey! \n [Next Page](@next)")
            })
        }
        PlaygroundPage.current.needsIndefiniteExecution = true
        PlaygroundPage.current.liveView = view
    }
    
    // removing MLRobot from live view
    public func removeRobot(){
        
        //initialising live view
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 600))
        view.backgroundColor = UIColor.white
        
        //initialising mlRobotImageView as UIImageView
        let mlRobotImageView = UIImageView()
        mlRobotImageView.frame.size = CGSize(width : 245, height : 400)
        mlRobotImageView.image = UIImage(named : "conclusionMLRobot.png")
        view.addSubview(mlRobotImageView)
        mlRobotImageView.center = view.center
        
        //initialising textLabel as UILabel
        let textLabel = UILabel()
        textLabel.frame.size = CGSize(width : 400, height: 100)
        textLabel.text = "Thank you for completing this Playground Book with me. \n\nUntil next time!"
        textLabel.font = UIFont.systemFont(ofSize: 20)
        textLabel.numberOfLines = 0
        textLabel.alpha = 1.0
        textLabel.textAlignment = .center
        view.addSubview(textLabel)
        textLabel.center.x = view.center.x
        textLabel.frame.origin.y = view.center.y + 225
        
        self.clapsAudioPlayer.play()

        
        UIView.animate(withDuration: 1.0, delay: 2.0, options: .allowUserInteraction, animations: {
            
            // changing horizontal position of mlRobotImageView
            mlRobotImageView.frame.origin.x = 512
            //changing alpga of textLabel from 1.0 to 0.0
            textLabel.alpha = 0.0
            
        }) { (true) in
            mlRobotImageView.frame.origin.x = 512
            textLabel.alpha = 0.0
        }
        
        PlaygroundPage.current.liveView = view
    }
}
