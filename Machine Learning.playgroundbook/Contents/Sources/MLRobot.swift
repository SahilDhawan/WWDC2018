
import UIKit
import PlaygroundSupport

public class MLRobot {
    
    public init(){
        //Initialiser
    }
    
    public func trainModel(){
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))
        view.backgroundColor = UIColor.white
        
        let robotImageView = UIImageView()
        robotImageView.image = UIImage(named : "readingMLRobot.png")
        robotImageView.frame.size = CGSize(width: 335, height: 400)
        view.addSubview(robotImageView)
        robotImageView.center = view.center
        
        var mlBrainCellArray : [UIImageView] = []
        
        for _ in 0..<10 {
            let xPoint = CGFloat(arc4random_uniform(450))
            let yPoint = CGFloat(arc4random_uniform(200))
            let y1Point = yPoint + 450.0
            
            let brainCell = UIImageView()
            brainCell.image = UIImage(named: "mlBrainCell.png")
            brainCell.frame.size = CGSize(width: 20, height: 20)
            brainCell.frame.origin = CGPoint(x: xPoint, y: yPoint)
            view.addSubview(brainCell)
            
            let secondCell = UIImageView()
            secondCell.image = UIImage(named: "mlBrainCell.png")
            secondCell.frame.size = CGSize(width: 20, height: 20)
            secondCell.frame.origin = CGPoint(x: xPoint, y: y1Point)
            view.addSubview(secondCell)
            
            mlBrainCellArray.append(brainCell)
            mlBrainCellArray.append(secondCell)
        }
        
        UIView.animate(withDuration: 2.0, animations: {
            
            for brainCell in mlBrainCellArray {
                brainCell.center = view.center
            }
            
        }) { (true) in
            //todo
            for brainCell in mlBrainCellArray {
                brainCell.removeFromSuperview()
            }
            PlaygroundPage.current.assessmentStatus = .pass(message: "Great job training your Model! Lets move to [Next Step](@next)  of Machine Learning.")
        }
        
        PlaygroundPage.current.liveView = view
    }
    
    public func evaluateModel(){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))
        view.backgroundColor = UIColor.white
        
        let evaluationDataImageView = UIImageView()
        evaluationDataImageView.image = UIImage(named : "evaluationData.png")
        evaluationDataImageView.frame.size = CGSize(width: 150, height: 300)
        evaluationDataImageView.contentMode = .scaleAspectFit
        evaluationDataImageView.alpha = 0.0
        view.addSubview(evaluationDataImageView)
        evaluationDataImageView.center = view.center
        
        let inputEvaluationDataImageView = UIImageView()
        inputEvaluationDataImageView.image = UIImage(named : "inputEvaluationData.png")
        inputEvaluationDataImageView.contentMode = .scaleAspectFit
        inputEvaluationDataImageView.frame.size = CGSize(width: 150, height: 220)
        inputEvaluationDataImageView.alpha = 0.0
        view.addSubview(inputEvaluationDataImageView)
        inputEvaluationDataImageView.center = view.center
        
        
        let evaluationMLRobotImageView = UIImageView()
        evaluationMLRobotImageView.image = UIImage(named : "evaluateMLRobot.png")
        evaluationMLRobotImageView.contentMode = .scaleAspectFit
        evaluationMLRobotImageView.frame.size = CGSize(width: 335, height: 400)
        evaluationMLRobotImageView.alpha = 0.0
        view.addSubview(evaluationMLRobotImageView)
        evaluationMLRobotImageView.center = view.center
        
        let outputEvaluationDataImageView = UIImageView()
        outputEvaluationDataImageView.image = UIImage(named : "outputEvaluationData.png")
        outputEvaluationDataImageView.contentMode = .scaleAspectFit
        outputEvaluationDataImageView.frame.size = CGSize(width: 15, height: 22)
        outputEvaluationDataImageView.alpha = 0.0
        view.addSubview(outputEvaluationDataImageView)
        outputEvaluationDataImageView.center = view.center
        
        UIView.animate(withDuration: 1.0, animations: {
            evaluationDataImageView.alpha = 1.0
        }) { (true) in
            
            UIView.animate(withDuration: 1.0, animations: {
                evaluationDataImageView.frame.size = CGSize(width: 15, height: 30)
                evaluationDataImageView.center = view.center
                
            }, completion: { (true) in
                
                UIView.animate(withDuration: 1.0, animations: {
                    evaluationDataImageView.removeFromSuperview()
                    inputEvaluationDataImageView.alpha = 1.0
                    
                }, completion: { (true) in
                    
                    UIView.animate(withDuration: 1.0, animations: {
                        inputEvaluationDataImageView.frame.size = CGSize(width: 15, height: 22)
                        inputEvaluationDataImageView.center = view.center
                        
                    }, completion: { (true) in
                        
                        UIView.animate(withDuration: 1.0, animations: {
                            evaluationMLRobotImageView.alpha = 1.0
                            inputEvaluationDataImageView.removeFromSuperview()
                            
                        }, completion: { (true) in
                            
                            UIView.animate(withDuration: 1.0, animations: {
                                outputEvaluationDataImageView.alpha = 1.0
                                outputEvaluationDataImageView.frame.size = CGSize(width: 85, height: 125)
                                outputEvaluationDataImageView.center = view.center
                                
                            }, completion: { (true) in
                                
                                UIView.animate(withDuration: 1.0, animations: {
                                    outputEvaluationDataImageView.frame.origin.y += 150
                                    
                                    PlaygroundPage.current.assessmentStatus = .pass(message: "Great job evaluating our machine learning model! Lets move to [Next Page](@next) to explore CoreML.")
                                })
                            })
                        })
                    })
                })
            })
        }
        
        
        PlaygroundPage.current.liveView = view
    }
}
