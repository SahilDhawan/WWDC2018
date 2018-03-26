import UIKit
import PlaygroundSupport

public class CoreML {
    
    public func init() {
       //Initialiser
    }
    
    public func showProcess(){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))
        view.backgroundColor = UIColor.white
        
        let mlRobotImageView = UIImageView()
        mlRobotImageView.image = UIImage(named : "mlrobot.png")
        mlRobotImageView.alpha = 1.0
        mlRobotImageView.frame.size = CGSize(width: 225, height: 375)
        
        view.addSubview(mlRobotImageView)
        mlRobotImageView.center = view.center
        
        
        let modelFileImageView = UIImageView()
        modelFileImageView.image = UIImage(named : "modelFile.png")
        modelFileImageView.frame.size = CGSize(width: 100, height: 150)
        modelFileImageView.alpha = 0.0
        view.addSubview(modelFileImageView)
        modelFileImageView.center = view.center
        
        let coreMLImageView = UIImageView()
        coreMLImageView.image = UIImage(named : "coreml.png")
        coreMLImageView.frame.size = CGSize(width: 125, height: 125)
        coreMLImageView.alpha = 0.0
        view.addSubview(coreMLImageView)
        coreMLImageView.center = view.center
        
        let mlModelFileImageView = UIImageView()
        mlModelFileImageView.image = UIImage(named : "mlmodelfile.png")
        mlModelFileImageView.frame.size = CGSize(width: 100, height: 150)
        mlModelFileImageView.alpha = 0.0
        view.addSubview(mlModelFileImageView)
        mlModelFileImageView.center = view.center
        
        let iphoneImageView = UIImageView()
        iphoneImageView.image = UIImage(named : "iPhone.png")
        iphoneImageView.frame.size = CGSize(width: 120, height: 200)
        iphoneImageView.alpha = 0.0
        view.addSubview(iphoneImageView)
        iphoneImageView.center = view.center
        
        UIView.animate(withDuration: 1.0, animations: {
            mlRobotImageView.frame.size = CGSize(width: 22.5, height: 37.5)
            mlRobotImageView.center = view.center
        }) { (true) in
            mlRobotImageView.removeFromSuperview()
            
            UIView.animate(withDuration: 1.0, animations: {
                modelFileImageView.alpha = 1.0
                
            }, completion: { (true) in
                
                UIView.animate(withDuration: 1.0, animations: {
                    modelFileImageView.frame.size = CGSize(width: 10, height: 15)
                    modelFileImageView.center = view.center
                    
                }, completion: { (true) in
                    
                    UIView.animate(withDuration: 1.0, animations: {
                        coreMLImageView.alpha = 1.0
                        
                    }, completion: { (true) in
                        
                        UIView.animate(withDuration: 1.0, animations: {
                            coreMLImageView.frame.size = CGSize(width: 12.5, height: 12.5)
                            coreMLImageView.center = view.center
                            
                        }, completion: { (true) in
                            
                            UIView.animate(withDuration: 1.0, animations: coreMLImageView.removeFromSuperview, completion: { (true) in
                                UIView.animate(withDuration: 1.0, animations: {
                                    mlModelFileImageView.alpha = 1.0
                                    
                                }, completion: { (true) in
                                    
                                    UIView.animate(withDuration: 1.0, animations: {
                                        
                                        mlModelFileImageView.frame.size = CGSize(width: 10, height: 15)
                                        mlModelFileImageView.center = view.center
                                        
                                    }, completion: { (true) in
                                        
                                        UIView.animate(withDuration: 1.0, animations: {
                                            
                                            mlModelFileImageView.removeFromSuperview()
                                            
                                        }, completion: { (true) in
                                            
                                            UIView.animate(withDuration: 1.0, animations: {
                                                iphoneImageView.alpha = 1.0
                                            })
                                        })
                                    })
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
