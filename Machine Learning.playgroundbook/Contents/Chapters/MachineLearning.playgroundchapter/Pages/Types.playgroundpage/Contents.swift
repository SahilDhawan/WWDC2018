/*:
 ## Types of Machine Learning
 Machine Learning process can be broadly classified into Supervised Learning and Unsupervised Learning based on the data set that is used to train the machine learning model.
 
 ## Supervised Learning
 Supervised learning is where you have input variables (x) and an output variable (Y) and you use an algorithm to learn the mapping function from the input to the output.
 
 It is called supervised learning because the process of an algorithm learning from the training dataset can be thought of as a teacher supervising the learning process. We know the correct answers, the algorithm iteratively makes predictions on the training data and is corrected by the teacher. Learning stops when the algorithm achieves an acceptable level of performance.
 
 ## Unsupervised Learning
 Unsupervised learning is where you only have input data (X) and no corresponding output variables.
 The goal for unsupervised learning is to model the underlying structure or distribution in the data in order to learn more about the data.
 
 These are called unsupervised learning because unlike supervised learning above there is no correct answers and there is no teacher. Algorithms are left to their own devises to discover and present the interesting structure in the data.
 */

//#-hidden-code

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))
view.backgroundColor = UIColor.white

let textLabel = UILabel()
textLabel.text = "Supervised Learning"
textLabel.textAlignment = .center
textLabel.textColor = UIColor.darkGray
textLabel.font = UIFont.boldSystemFont(ofSize: 30)
textLabel.frame.size = CGSize(width: 300, height: 40)
textLabel.alpha = 0.0
view.addSubview(textLabel)
textLabel.center = view.center

let superVisedLearningImageView = UIImageView()
superVisedLearningImageView.image = UIImage(named : "supervised.png")
superVisedLearningImageView.frame.size = CGSize(width: 325, height: 150)

superVisedLearningImageView.alpha = 0.0
view.addSubview(superVisedLearningImageView)
superVisedLearningImageView.center = view.center

let mlBrainImageView = UIImageView()
mlBrainImageView.frame.size = CGSize(width: 300, height: 260)
mlBrainImageView.image = UIImage(named : "mlbrain.png")
mlBrainImageView.alpha = 0.0
view.addSubview(mlBrainImageView)
mlBrainImageView.center = view.center


let textLabel1 = UILabel()
textLabel1.text = "Unsupervised Learning"
textLabel1.textAlignment = .center
textLabel1.textColor = UIColor.darkGray
textLabel1.font = UIFont.boldSystemFont(ofSize: 25)
textLabel1.frame.size = CGSize(width: 300, height: 40)
textLabel1.alpha = 0.0
view.addSubview(textLabel1)
textLabel1.center = view.center


let unsuperVisedLearningImageView = UIImageView()
unsuperVisedLearningImageView.image = UIImage(named : "unsupervised.png")
unsuperVisedLearningImageView.frame.size = CGSize(width: 150, height: 150)
unsuperVisedLearningImageView.alpha = 0.0
view.addSubview(unsuperVisedLearningImageView)
unsuperVisedLearningImageView.center = view.center

UIView.animate(withDuration: 1.5, animations: {
    textLabel.alpha = 1.0
}) { (true) in
    textLabel.removeFromSuperview()
    UIView.animate(withDuration: 1.0, animations: {
        superVisedLearningImageView.alpha = 1.0
    }, completion: { (true) in
        UIView.animate(withDuration: 1.5, animations: {
            superVisedLearningImageView.frame.size = CGSize(width: 32.5, height: 15)
            superVisedLearningImageView.center = view.center
            mlBrainImageView.alpha = 1.0
            mlBrainImageView.frame.size = CGSize(width: 400, height: 350)
            mlBrainImageView.center = view.center
        }, completion: { (true) in
            superVisedLearningImageView.removeFromSuperview()
            
            UIView.animate(withDuration: 1.0, animations: {
                mlBrainImageView.alpha = 0.0
            }, completion: { (true) in
                UIView.animate(withDuration: 1.0, animations: {
                    textLabel1.alpha = 1.0
                }, completion: { (true) in
                    textLabel1.removeFromSuperview()
                    UIView.animate(withDuration: 1.0, animations: {
                        unsuperVisedLearningImageView.alpha = 1.0
                    }, completion: { (true) in
                        UIView.animate(withDuration: 1.0, animations: {
                            unsuperVisedLearningImageView.frame.size = CGSize(width: 15, height: 15)
                            unsuperVisedLearningImageView.center = view.center
                            mlBrainImageView.alpha = 1.0
                            mlBrainImageView.frame.size = CGSize(width: 400, height: 350)
                            mlBrainImageView.center = view.center
                        }, completion: { (true) in
                            unsuperVisedLearningImageView.removeFromSuperview()
                        })
                    })
                })
            })
        })
    })
}

PlaygroundPage.current.liveView = view




