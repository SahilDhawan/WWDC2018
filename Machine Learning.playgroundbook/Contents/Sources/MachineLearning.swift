import PlaygroundSupport
import UIKit
import SceneKit
import SpriteKit


public class MachineLearning {
    
    public init(){
        // Initialiser
    }
    
    public func gatherData(){
        // array representing different weights of data
        let array = [2,3,10,5,8,7]
        
        let greenColor = UIColor(displayP3Red: 83/255, green: 136/255, blue: 26/255, alpha: 1.0)
         let backgroundColor = UIColor(displayP3Red: 104/255, green: 104/255, blue: 104/255, alpha: 1.0)
        
        //intialising live view
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))
        view.backgroundColor = UIColor.white
        
        // an array to store bar graph views
        var barGraphViewArray : [UIView] = []
        
        // sorting the array in descending order using sorting closure
        let sortedArray = array.sorted { (a, b) -> Bool in
            return a > b
        }
        let biggestValue = sortedArray.first
        
       // initialising view as a background view for bar views
        let backgroundView = UIView()
        
        backgroundView.frame.size = CGSize(width: 330, height: -(biggestValue!+2)*25)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 20
        backgroundView.center = view.center
        view.addSubview(backgroundView)
        
        // initialising gathering label
        let gatheringLabel = UILabel()
        gatheringLabel.text = "Gathering Data"
        gatheringLabel.textColor = backgroundColor
        gatheringLabel.frame.size = CGSize(width: 350, height: 50)
        gatheringLabel.textAlignment = .center
        gatheringLabel.font = UIFont.boldSystemFont(ofSize: 35)
        gatheringLabel.center.x = view.center.x
        gatheringLabel.center.y = view.center.y - 200
        view.addSubview(gatheringLabel)
        
        //initialising preparation label
        let preparationLabel = UILabel()
        preparationLabel.text = "Data Preparation"
        preparationLabel.textColor = backgroundColor
        preparationLabel.frame.size = CGSize(width: 350, height: 50)
        preparationLabel.textAlignment = .center
        preparationLabel.font = UIFont.boldSystemFont(ofSize: 35)
        preparationLabel.center.x = view.center.x
        preparationLabel.center.y = view.center.y - 200
        preparationLabel.alpha = 0.0
        view.addSubview(preparationLabel)
        
        // adding bar graph views to live view
        for i in 0..<array.count {
            let barView = UIView()
            let value = array[i]
            let preHorizontalValue = backgroundView.frame.origin.x + 20.0
            barView.frame.origin.x = CGFloat(i*50) + preHorizontalValue
            barView.frame.origin.y = backgroundView.frame.origin.y + backgroundView.frame.height - 20
            barView.layer.borderColor = UIColor.black.cgColor
            barView.layer.borderWidth = 0.5
            barView.frame.size = CGSize(width: 40, height: 0)
            barView.backgroundColor = UIColor.white
            
            barGraphViewArray.append(barView)
            
            // animating height of bar graph views
            UIView.animate(withDuration: 1.0, animations: {
                let partialValue = value * 25
                barView.frame.size.height = CGFloat(-1 * partialValue)
                view.addSubview(barView)
            })
        }
        
        // animating bar graph views position
        UIView.animate(withDuration: 1.5, delay: 2.0, options: .curveEaseIn, animations: {
            gatheringLabel.alpha = 0.0
            preparationLabel.alpha = 1.0
            barGraphViewArray[0].frame.origin.x += 2*50
            barGraphViewArray[2].frame.origin.x -= 2*50
            
            barGraphViewArray[1].frame.origin.x += 2*50
            barGraphViewArray[3].frame.origin.x -= 2*50
        }) { (true) in
            
            // changing alpha of background view from 1.0 to 0.0
            UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseInOut, animations: {
                
                backgroundView.alpha = 0.0
                
                // separating bar graph views into testing data
                for i in 0..<array.count - 2 {
                    barGraphViewArray[i].frame.origin.x -= 25
                }
                
                for i in 0...3 {
                    barGraphViewArray[i].backgroundColor = backgroundColor
                }
                
                // separating bar graph views into evaluation data
                barGraphViewArray[4].backgroundColor = greenColor
                barGraphViewArray[5].backgroundColor = greenColor
                barGraphViewArray[4].frame.origin.x += 30
                barGraphViewArray[5].frame.origin.x += 30
            }) { (true) in
                
                // adding training data label to live view
                let label1 = UILabel()
              
                label1.text = "Training Data"
                label1.textColor = backgroundColor
                label1.font = UIFont.systemFont(ofSize: 20)
                label1.textAlignment = .center
                label1.frame.size.width = 100
                label1.frame.size.height = 60
                label1.numberOfLines = 0
                label1.frame.origin.x = backgroundView.frame.origin.x + 40
                label1.frame.origin.y = view.center.y + 150
                view.addSubview(label1)
                
                // adding evaluation data label to live view
                let label2 = UILabel()
                label2.text = "Evaluation Data"
                label2.textColor = backgroundColor
                label2.font = UIFont.systemFont(ofSize: 20)
                label2.textAlignment = .center
                label2.frame.size.width = 100
                label2.frame.size.height = 60
                label2.numberOfLines = 0
                label2.frame.origin.x = backgroundView.frame.origin.x + 200 + 40
                label2.frame.origin.y = view.center.y + 150
                label2.textColor = greenColor
                view.addSubview(label2)
                
                //showing success alert
                PlaygroundPage.current.assessmentStatus = .pass(message: "Great job gathering the data! Lets move to [Next Step](@next)  of Machine Learning.")
                
            }
        }
        PlaygroundPage.current.liveView = view
    }
    
    //Choosing Model
    
    let imageModelImageView = UIImageView()
    let musicModelImageView = UIImageView()
    let textModelImageView = UIImageView()
    let textLabel = UILabel()
    let mlRobotImageView = UIImageView()
    
    // initialising custom view for live view
    let chooseModelView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))
    
    // public enum for model selection
    public enum Model {
        case textModel
        case imageModel
        case musicModel
    }
    
    //setting up default view
    public func setupChooseModelView(){
        self.chooseModelView.backgroundColor = UIColor.white
        
        //setting up robotView
        self.mlRobotImageView.image = UIImage(named : "mlrobot.png")
        self.mlRobotImageView.frame.size = CGSize(width: 225, height: 375)
        self.mlRobotImageView.alpha = 0.0
        self.chooseModelView.addSubview(mlRobotImageView)
        
        //setting up textLabel
        self.textLabel.text = "Choosing Model"
        self.textLabel.textColor =  UIColor.darkGray
        self.textLabel.center.x = 100
        self.textLabel.frame.size = CGSize(width: 300, height: 40)
        self.textLabel.textAlignment = .center
        self.textLabel.frame.origin.y = 150
        self.textLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        self.chooseModelView.addSubview(textLabel)
        
        // adding models as UIImageView to live view
        self.imageModelImageView.frame.size = CGSize(width: 150, height: 150)
        self.imageModelImageView.frame.origin = CGPoint(x: 100, y: 200)
        self.imageModelImageView.image = UIImage(named: "imageModel.png")
        self.imageModelImageView.contentMode = .scaleAspectFit
        
        self.musicModelImageView.frame.size = CGSize(width: 150, height: 150)
        self.musicModelImageView.frame.origin = CGPoint(x: 100, y: 400)
        self.musicModelImageView.image = UIImage(named: "musicModel.png")
        self.musicModelImageView.contentMode = .scaleAspectFit
        
        self.textModelImageView.frame.size = CGSize(width: 150, height: 150)
        self.textModelImageView.frame.origin = CGPoint(x: 300, y: 300)
        self.textModelImageView.image = UIImage(named: "textModel.png")
        self.textModelImageView.contentMode = .scaleAspectFit
        
        self.chooseModelView.addSubview(imageModelImageView)
        self.chooseModelView.addSubview(musicModelImageView)
        self.chooseModelView.addSubview(textModelImageView)
        
        PlaygroundPage.current.liveView = self.chooseModelView
    }
    
    public func chooseModel(_ model : Model){
    
        // setting up basic layout
        setupChooseModelView()

        // switch case for model
        switch model {
            // if model is imageModel
        case .imageModel:
            UIView.animate(withDuration: 1.0
                , animations: {
                    // hiding musicModel and textModel
                    self.musicModelImageView.alpha = 0.0
                    self.textModelImageView.alpha = 0.0
                    
                    //changing alpha of mlRobotImageView from 0.0 to 1.0
                    self.mlRobotImageView.alpha = 1.0
                    self.mlRobotImageView.center = self.chooseModelView.center
                    
                    //changing alpha of textLabel from 1.0 to 0.0
                    self.textLabel.alpha = 0.0
                    
                    // animating imageModelImageView
                    self.imageModelImageView.frame.size = CGSize(width: 30, height: 30)
                    self.imageModelImageView.center = self.chooseModelView.center
                    self.imageModelImageView.frame.origin.y += 55
            }, completion: { (true) in
                
                //changing image of imageModelImageView
                self.imageModelImageView.image = UIImage(named : "imageModelGreen")
                
            })
            break
        case .musicModel:
            //if model is music model
            UIView.animate(withDuration: 1.0
                , animations: {
                    // hiding imageModelImageView and textModelImageView
                    self.imageModelImageView.alpha = 0.0
                    self.textModelImageView.alpha = 0.0
                    
                    //changing alpha of mlRobotImageView from 0.0 to 1.0
                    self.mlRobotImageView.alpha = 1.0
                    self.mlRobotImageView.center = self.chooseModelView.center
                    
                    //changing alpha of textLabel from 1.0 to 0.0
                    self.textLabel.alpha = 0.0
                    
                    //aniamting musicModelImageView
                    self.musicModelImageView.frame.size = CGSize(width: 35, height: 35)
                    self.musicModelImageView.center = self.chooseModelView.center
                    self.musicModelImageView.frame.origin.y += 55
            }, completion: { (true) in
                
                //changing image of musicModelImageView
                self.musicModelImageView.image = UIImage(named : "musicModelGreen.png")
                
            })
            
            break
        case .textModel:
            // if model is textModel
            UIView.animate(withDuration: 1.0
                , animations: {
                    
                    //hiding imageModelImageView and musicModelImageView
                    self.imageModelImageView.alpha = 0.0
                    self.musicModelImageView.alpha = 0.0
                    
                    //changing alpha of mlRobotImageView from 0.0 to 1.0
                    self.mlRobotImageView.alpha = 1.0
                    self.mlRobotImageView.center = self.chooseModelView.center
                    
                    //changing alpha of textLabel from 1.0 to 0.0
                    self.textLabel.alpha = 0.0
                    
                    //animating textModelImageView
                    self.textModelImageView.frame.size = CGSize(width: 25, height: 25)
                    self.textModelImageView.center = self.chooseModelView.center
                    self.textModelImageView.frame.origin.y += 55
            }, completion: { (true) in
                //changing image of textModelImageView
                self.textModelImageView.image = UIImage(named : "textModelGreen.png")
            })
            
            break
        }
        
        //showing success alert
        PlaygroundPage.current.assessmentStatus = .pass(message: "Great job choosing model! Lets move to [Next Step](@next)  of Machine Learning.")
    }
    
}
