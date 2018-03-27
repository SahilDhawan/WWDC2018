
import UIKit
import PlaygroundSupport
import AVFoundation

public class MLRobot {
    var audioPlayer = AVAudioPlayer()
    
    public init(){
        let talkingSoundPath = Bundle.main.path(forResource: "processing", ofType: "mp3")
        let talkingSoundUrl = URL(fileURLWithPath: talkingSoundPath!)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: talkingSoundUrl)
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.volume = 1.0
        } catch {
            print(error)
        }
    }
    
    // training Model
    public func trainModel(){
        
        //initialising live view
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))
        view.backgroundColor = UIColor.white
        
        // initialising robotImageView as UIImageView
        let robotImageView = UIImageView()
        robotImageView.image = UIImage(named : "readingMLRobot.png")
        robotImageView.frame.size = CGSize(width: 335, height: 400)
        view.addSubview(robotImageView)
        robotImageView.center = view.center
        
        //array to store UIImageViews
        var mlBrainCellArray : [UIImageView] = []
        
        // adding 20 brain cells
        for _ in 0..<10 {
            let xPoint = CGFloat(arc4random_uniform(450))
            let yPoint = CGFloat(arc4random_uniform(200))
            let y1Point = yPoint + 450.0
            
            // adding brain cells on random positions in live view
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
            
            // appending brain cells in mlBrainCellArray
            mlBrainCellArray.append(brainCell)
            mlBrainCellArray.append(secondCell)
        }
        
        self.audioPlayer.play()

        
        UIView.animate(withDuration: 2.0, animations: {
            
            
            for brainCell in mlBrainCellArray {
                //changing center of brain cell to center of view
                brainCell.center = view.center
            }
            
        }) { (true) in
            // removing brain cells from superview
            for brainCell in mlBrainCellArray {
                brainCell.removeFromSuperview()
            }
            //showing success alert
            self.audioPlayer.stop()
            PlaygroundPage.current.assessmentStatus = .pass(message: "Great job training your Model! Lets move to [Next Step](@next)  of Machine Learning.")
        }
        
        PlaygroundPage.current.liveView = view
    }
    
    // evaluating data
    public func evaluateModel(){
        
        //view cycle
        // evaluationDataImageView -> inputEvaluationDataImageView -> evaluationMLRobotImageView -> outputEvaluationDataImageView
        
        //initialising live view
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))
        view.backgroundColor = UIColor.white
        
        // initialsing evaluationDataImageView as UIImageView
        let evaluationDataImageView = UIImageView()
        evaluationDataImageView.image = UIImage(named : "evaluationData.png")
        evaluationDataImageView.frame.size = CGSize(width: 150, height: 300)
        evaluationDataImageView.contentMode = .scaleAspectFit
        evaluationDataImageView.alpha = 0.0
        view.addSubview(evaluationDataImageView)
        evaluationDataImageView.center = view.center
        
        //intialising inputEvaluationDataImageView as UIImageView
        let inputEvaluationDataImageView = UIImageView()
        inputEvaluationDataImageView.image = UIImage(named : "inputEvaluationData.png")
        inputEvaluationDataImageView.contentMode = .scaleAspectFit
        inputEvaluationDataImageView.frame.size = CGSize(width: 150, height: 220)
        inputEvaluationDataImageView.alpha = 0.0
        view.addSubview(inputEvaluationDataImageView)
        inputEvaluationDataImageView.center = view.center
        
        // initialising evaluationMLRobotImageView as UIImageView
        let evaluationMLRobotImageView = UIImageView()
        evaluationMLRobotImageView.image = UIImage(named : "evaluateMLRobot.png")
        evaluationMLRobotImageView.contentMode = .scaleAspectFit
        evaluationMLRobotImageView.frame.size = CGSize(width: 335, height: 400)
        evaluationMLRobotImageView.alpha = 0.0
        view.addSubview(evaluationMLRobotImageView)
        evaluationMLRobotImageView.center = view.center
        
        //initialising outputEvaluationDataImageView as UIImageView
        let outputEvaluationDataImageView = UIImageView()
        outputEvaluationDataImageView.image = UIImage(named : "outputEvaluationData.png")
        outputEvaluationDataImageView.contentMode = .scaleAspectFit
        outputEvaluationDataImageView.frame.size = CGSize(width: 15, height: 22)
        outputEvaluationDataImageView.alpha = 0.0
        view.addSubview(outputEvaluationDataImageView)
        outputEvaluationDataImageView.center = view.center
        
        UIView.animate(withDuration: 1.0, animations: {
            //changing alpha of evaluationDataImageView from 0.0 to 1.0
            evaluationDataImageView.alpha = 1.0
        }) { (true) in
            
            UIView.animate(withDuration: 1.0, animations: {
                // changing size of evaluationDataImageView to 10%
                evaluationDataImageView.frame.size = CGSize(width: 15, height: 30)
                evaluationDataImageView.center = view.center
                
            }, completion: { (true) in
                
                UIView.animate(withDuration: 1.0, animations: {
                    //removing evaluationDataImageView from superview
                    evaluationDataImageView.removeFromSuperview()
                    inputEvaluationDataImageView.alpha = 1.0
                    
                }, completion: { (true) in
                    
                    UIView.animate(withDuration: 1.0, animations: {
                        // changing size of inputEvaluationDataSize to 10%
                        inputEvaluationDataImageView.frame.size = CGSize(width: 15, height: 22)
                        inputEvaluationDataImageView.center = view.center
                        
                    }, completion: { (true) in
                        inputEvaluationDataImageView.removeFromSuperview()

                        UIView.animate(withDuration: 1.0, animations: {
                            // changing alpha of evaluationMLRobotImageView from 0.0 to 1.0
                            evaluationMLRobotImageView.alpha = 1.0
                            self.audioPlayer.play()
                            // removing inputEvaluationDataImageView from superview
                            
                        }, completion: { (true) in
                            
                            UIView.animate(withDuration: 1.0, animations: {
                                // changing alpha of outputEvaluationDataImageView from 0.0 to 1.0
                                outputEvaluationDataImageView.alpha = 1.0
                                //scaling outputEvaluationDataImageView to 10x
                                outputEvaluationDataImageView.frame.size = CGSize(width: 85, height: 125)
                                outputEvaluationDataImageView.center = view.center
                                
                            }, completion: { (true) in
                                
                                UIView.animate(withDuration: 1.0, animations: {
                                    // changing vertical position of outputEvaluationDataImageView
                                    outputEvaluationDataImageView.frame.origin.y += 150
                                    
                                    //showing success alert
                                    self.audioPlayer.stop()

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
