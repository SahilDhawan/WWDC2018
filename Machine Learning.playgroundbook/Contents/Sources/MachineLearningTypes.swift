import UIKit
import PlaygroundSupport

public class MachineLearningTypes {
    public init(){
        //Intialiser
    }
    
    public func setupView(){
        // initialising Live View
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))
        view.backgroundColor = UIColor.white
        
        // initialising supervisedLabel as UILabel
        let supervisedLabel = UILabel()
        supervisedLabel.text = "Supervised Learning"
        supervisedLabel.textAlignment = .center
        supervisedLabel.textColor = UIColor.darkGray
        supervisedLabel.font = UIFont.boldSystemFont(ofSize: 30)
        supervisedLabel.frame.size = CGSize(width: 300, height: 40)
        supervisedLabel.alpha = 0.0
        view.addSubview(supervisedLabel)
        supervisedLabel.center = view.center
        
        // initialising supervisedLearningImageView as UIImageView
        let supervisedLearningImageView = UIImageView()
        supervisedLearningImageView.image = UIImage(named : "readingMLRobot.png")
        supervisedLearningImageView.frame.size = CGSize(width: 335, height: 400)
        supervisedLearningImageView.alpha = 0.0
        view.addSubview(supervisedLearningImageView)
        supervisedLearningImageView.center = view.center
        
        // initialising unsupervisedLabel as UILabel
        let unsupervisedLabel = UILabel()
        unsupervisedLabel.text = "Unsupervised Learning"
        unsupervisedLabel.textAlignment = .center
        unsupervisedLabel.textColor = UIColor.darkGray
        unsupervisedLabel.font = UIFont.boldSystemFont(ofSize: 25)
        unsupervisedLabel.frame.size = CGSize(width: 300, height: 40)
        unsupervisedLabel.alpha = 0.0
        view.addSubview(unsupervisedLabel)
        unsupervisedLabel.center = view.center
        
        // initialising unsupervisedLearningImageView as ImageView
        let unsupervisedLearningImageView = UIImageView()
        unsupervisedLearningImageView.image = UIImage(named : "unsupervisedLearning.png")
        unsupervisedLearningImageView.frame.size = CGSize(width: 272, height: 400)
        unsupervisedLearningImageView.alpha = 0.0
        view.addSubview(unsupervisedLearningImageView)
        unsupervisedLearningImageView.center = view.center
        
        UIView.animate(withDuration: 1.5, animations: {
            //changing supervisedLabel from 0.0 to 1.0
            supervisedLabel.alpha = 1.0
        }) { (true) in
            //removing supervisedLabel from superview
            supervisedLabel.removeFromSuperview()
            UIView.animate(withDuration: 1.0, animations: {
                //changing alpha of supervisedLearningImageView from 0.0 to 1.0
                supervisedLearningImageView.alpha = 1.0
            }, completion: { (true) in
                UIView.animate(withDuration: 1.0, animations: {
                    // removing supervisedLearningImageView from superview
                    supervisedLearningImageView.removeFromSuperview()
                }, completion: { (true) in
                    UIView.animate(withDuration: 1.0, animations: {
                        //changing alpha of unsupervisedLabel from 0.0 to 1.0
                        unsupervisedLabel.alpha = 1.0
                    }, completion: { (true) in
                        //removing unsupervisedLabel from superview
                        unsupervisedLabel.removeFromSuperview()
                        UIView.animate(withDuration: 1.0, animations: {
                            //changing alpha of unsupervisedLearningImageView from 0.0 to 1.0
                            unsupervisedLearningImageView.alpha = 1.0
                            
                             PlaygroundPage.current.assessmentStatus = .pass(message: "Great job learning different types of machine learning! Lets move to [Next Page](@next) to explore different steps of Machine Learning.")
                        })
                    })
                })
            })
            
            
        }
        
        PlaygroundPage.current.liveView = view
    }
}

