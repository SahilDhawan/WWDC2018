//#-hidden-code
// Present Robot

import PlaygroundSupport
import UIKit

public class MoveRobot {
    
    public init(){
        // initialiser method
    }
    
    public func presentRobot(){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 512, height: 1024))
        view.backgroundColor = UIColor.white
        let imageView = UIImageView(frame: CGRect(x: 512, y: 100, width: 225, height: 375))
        imageView.image = UIImage(named : "mlrobot.png")
        view.addSubview(imageView)
        
        let textLabel = UILabel(frame: CGRect(x:56, y: 500, width: 400, height: 100))
        textLabel.text = "Hello Reader, I am Sahil! \n\nLets begin our journey and Find what Machine Learning is!"
        textLabel.font = UIFont.systemFont(ofSize: 20)
        textLabel.numberOfLines = 0
        textLabel.alpha = 0.0
        textLabel.textAlignment = .center
        view.addSubview(textLabel)
        
        UIView.animate(withDuration: 1.0, animations: {
            imageView.frame.origin.x = (512-225)/2
        }) { (true) in
            imageView.frame.origin.x = (512-225)/2
            
            UIView.animate(withDuration: 0.5, animations: {
                textLabel.alpha = 1.0
                PlaygroundPage.current.assessmentStatus = .pass(message: "Lets begin our journey! \n [Next Page](@next)")
            })
        }
        PlaygroundPage.current.liveView = view
        //#-end-hidden-code
    }
    
    public func removeRobot(){
    // Remove Robot
        
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 512, height: 1024))
    view.backgroundColor = UIColor.white
    let imageView = UIImageView(frame: CGRect(x: (512-225)/2, y: 100, width: 210, height: 350))
    imageView.image = UIImage(named : "conclusionMLRobot.png")
    view.addSubview(imageView)
    
    let textLabel = UILabel(frame: CGRect(x:56, y: 500, width: 400, height: 100))
    textLabel.text = "Thank you for completing this Playground Book with me. \n\nUntil next time!"
    textLabel.font = UIFont.systemFont(ofSize: 20)
    textLabel.numberOfLines = 0
    textLabel.alpha = 1.0
    textLabel.textAlignment = .center
    view.addSubview(textLabel)
    
    UIView.animate(withDuration: 1.0, delay: 2.0, options: .allowUserInteraction, animations: {
    imageView.frame.origin.x = 512
    textLabel.alpha = 0.0
    
    }) { (true) in
    imageView.frame.origin.x = 512
    textLabel.alpha = 0.0
    }
    PlaygroundPage.current.liveView = view
    }
}
