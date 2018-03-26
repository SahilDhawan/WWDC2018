import PlaygroundSupport
import UIKit
import SceneKit
import SpriteKit


public class MachineLearning {
    
    public init(){
        // Initialiser
    }
    
    public func gatherData(){
        
        let array = [2,3,10,5,8,7]
        let greenColor = UIColor(displayP3Red: 83/255, green: 136/255, blue: 26/255, alpha: 1.0)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))
        view.backgroundColor = UIColor.white
        
        var barGraphViewArray : [UIView] = []
        
        let sortedArray = array.sorted { (a, b) -> Bool in
            return a > b
        }
        let biggestValue = sortedArray.first
        let backgroundColor = UIColor(displayP3Red: 104/255, green: 104/255, blue: 104/255, alpha: 1.0)
        let backgroundView = UIView()
        
        backgroundView.frame.size = CGSize(width: 330, height: -(biggestValue!+2)*25)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 20
        backgroundView.center = view.center
        view.addSubview(backgroundView)
        
        let gatheringLabel = UILabel()
        gatheringLabel.text = "Gathering Data"
        gatheringLabel.textColor = backgroundColor
        gatheringLabel.frame.size = CGSize(width: 350, height: 50)
        gatheringLabel.textAlignment = .center
        gatheringLabel.font = UIFont.boldSystemFont(ofSize: 35)
        gatheringLabel.center.x = view.center.x
        gatheringLabel.center.y = view.center.y - 200
        view.addSubview(gatheringLabel)
        
        
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
            
            UIView.animate(withDuration: 1.0, animations: {
                let partialValue = value * 25
                
                barView.frame.size.height = CGFloat(-1 * partialValue)
                
                view.addSubview(barView)
            })
        }
        
        
        UIView.animate(withDuration: 1.5, delay: 2.0, options: .curveEaseIn, animations: {
            gatheringLabel.alpha = 0.0
            preparationLabel.alpha = 1.0
            barGraphViewArray[0].frame.origin.x += 2*50
            barGraphViewArray[2].frame.origin.x -= 2*50
            
            barGraphViewArray[1].frame.origin.x += 2*50
            barGraphViewArray[3].frame.origin.x -= 2*50
        }) { (true) in
            
            
            UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseInOut, animations: {
                
                backgroundView.alpha = 0.0
                
                for i in 0..<array.count - 2 {
                    barGraphViewArray[i].frame.origin.x -= 25
                }
                
                for barView in barGraphViewArray {
                    barView.backgroundColor = backgroundColor
                }
                
                barGraphViewArray[4].frame.origin.x += 30
                barGraphViewArray[5].frame.origin.x += 30
            }) { (true) in
                
                let label1 = UILabel()
                barGraphViewArray[4].backgroundColor = greenColor
                barGraphViewArray[5].backgroundColor = greenColor
                label1.text = "Training Data"
                label1.textColor = backgroundColor
                label1.font = UIFont.systemFont(ofSize: 20)
                label1.textAlignment = .center
                label1.frame.size.width = 100
                label1.frame.size.height = 60
                label1.numberOfLines = 0
                label1.frame.origin.x = backgroundView.frame.origin.x + 40
                label1.frame.origin.y = view.center.y + 150
                //        label1.backgroundColor = UIColor.red
                view.addSubview(label1)
                
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
                PlaygroundPage.current.assessmentStatus = .pass(message: "Great job gathering the data! Lets move to [Next Step](@next)  of Machine Learning.")
                
            }
        }
        PlaygroundPage.current.liveView = view
        
        //swap values as well
        
    }
    
    //Choosing Model
    
    let imageView1 = UIImageView()
    let imageView2 = UIImageView()
    let imageView3 = UIImageView()
    let textLabel = UILabel()
    let robotView = UIImageView()
    
    let chooseModelView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))
    
    public func setupChooseModelView(){
        self.chooseModelView.backgroundColor = UIColor.white
        
        self.robotView.image = UIImage(named : "mlrobot.png")
        self.robotView.frame.size = CGSize(width: 225, height: 375)
        self.robotView.alpha = 0.0
        self.chooseModelView.addSubview(robotView)
        
        self.textLabel.text = "Choosing Model"
        self.textLabel.textColor =  UIColor.darkGray
        self.textLabel.center.x = 100
        self.textLabel.frame.size = CGSize(width: 300, height: 40)
        self.textLabel.textAlignment = .center
        self.textLabel.frame.origin.y = 150
        self.textLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        self.chooseModelView.addSubview(textLabel)
        
        self.imageView1.frame.size = CGSize(width: 150, height: 150)
        self.imageView1.frame.origin = CGPoint(x: 100, y: 200)
        self.imageView1.image = UIImage(named: "imageModel.png")
        self.imageView1.contentMode = .scaleAspectFit
        
        self.imageView2.frame.size = CGSize(width: 150, height: 150)
        self.imageView2.frame.origin = CGPoint(x: 100, y: 400)
        self.imageView2.image = UIImage(named: "musicModel.png")
        self.imageView2.contentMode = .scaleAspectFit
        
        self.imageView3.frame.size = CGSize(width: 150, height: 150)
        self.imageView3.frame.origin = CGPoint(x: 300, y: 300)
        self.imageView3.image = UIImage(named: "textModel.png")
        self.imageView3.contentMode = .scaleAspectFit
        
        self.chooseModelView.addSubview(imageView1)
        self.chooseModelView.addSubview(imageView2)
        self.chooseModelView.addSubview(imageView3)
        
        PlaygroundPage.current.liveView = self.chooseModelView
    }
    
    public func chooseModel(_ model : String){
        
        setupChooseModelView()

        switch model {
        case "imageModel":
            UIView.animate(withDuration: 1.0
                , animations: {
                    self.imageView2.alpha = 0.0
                    self.imageView3.alpha = 0.0
                    self.imageView1.frame.size = CGSize(width: 30, height: 30)
                    self.robotView.alpha = 1.0
                    
                    self.textLabel.textColor = UIColor.darkGray
                    self.textLabel.alpha = 0.0
                    self.imageView1.center = self.chooseModelView.center
                    self.robotView.center = self.chooseModelView.center
                    self.imageView1.frame.origin.y += 55
            }, completion: { (true) in
                
                self.imageView1.image = UIImage(named : "imageModelGreen")
                PlaygroundPage.current.assessmentStatus = .pass(message: "Great job choosing model! Lets move to [Next Step](@next)  of Machine Learning.")
                
            })
            break
        case "musicModel":
            
            UIView.animate(withDuration: 1.0
                , animations: {
                    self.imageView1.alpha = 0.0
                    self.imageView3.alpha = 0.0
                    self.imageView2.frame.size = CGSize(width: 35, height: 35)
                    self.robotView.alpha = 1.0
                    
                    self.textLabel.textColor = UIColor.darkGray
                    self.textLabel.alpha = 0.0
                    self.imageView2.center = self.chooseModelView.center
                    self.robotView.center = self.chooseModelView.center
                    self.imageView2.frame.origin.y += 55
            }, completion: { (true) in
                
                self.imageView2.image = UIImage(named : "musicModelGreen.png")
                PlaygroundPage.current.assessmentStatus = .pass(message: "Great job choosing model! Lets move to [Next Step](@next)  of Machine Learning.")
                
            })
            
            break
        case "textModel":
            
            UIView.animate(withDuration: 1.0
                , animations: {
                    self.imageView1.alpha = 0.0
                    self.imageView2.alpha = 0.0
                    self.imageView3.frame.size = CGSize(width: 25, height: 25)
                    self.robotView.alpha = 1.0
                    self.textLabel.alpha = 0.0
                    self.imageView3.center = self.chooseModelView.center
                    self.robotView.center = self.chooseModelView.center
                    self.imageView3.frame.origin.y += 55
            }, completion: { (true) in
                
                self.imageView3.image = UIImage(named : "textModelGreen.png")
                PlaygroundPage.current.assessmentStatus = .pass(message: "Great job choosing model! Lets move to [Next Step](@next)  of Machine Learning.")
            })
            
            break
        default:
            //todo
            break
        }
        

    }
    
}
