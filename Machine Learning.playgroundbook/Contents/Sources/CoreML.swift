import UIKit
import PlaygroundSupport

public class CoreML {
    
    public init() {
       //Initialiser
    }
    
    public func showProcess(){
        
        //view cycle
        //mlRobotImageView -> modelFileImageView -> coreMLImageView -> mlModelFileImageView -> iPhoneImageView
        
        //initialising view
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))
        view.backgroundColor = UIColor.white
        
        //initialising mlRobotImageView as  UIImageView
        let mlRobotImageView = UIImageView()
        mlRobotImageView.image = UIImage(named : "mlrobot.png")
        mlRobotImageView.alpha = 1.0
        mlRobotImageView.frame.size = CGSize(width: 225, height: 375)
        view.addSubview(mlRobotImageView)
        mlRobotImageView.center = view.center
        
        //initialising modelFileImageView as  UIImageView
        let modelFileImageView = UIImageView()
        modelFileImageView.image = UIImage(named : "modelFile.png")
        modelFileImageView.frame.size = CGSize(width: 100, height: 150)
        modelFileImageView.alpha = 0.0
        view.addSubview(modelFileImageView)
        modelFileImageView.center = view.center
        
        //initalising coreMLImageView as  UIImageView
        let coreMLImageView = UIImageView()
        coreMLImageView.image = UIImage(named : "coreml.png")
        coreMLImageView.frame.size = CGSize(width: 125, height: 125)
        coreMLImageView.alpha = 0.0
        view.addSubview(coreMLImageView)
        coreMLImageView.center = view.center
        
        //initialising mlModelFileImageView as  UIImageView
        let mlModelFileImageView = UIImageView()
        mlModelFileImageView.image = UIImage(named : "mlmodelfile.png")
        mlModelFileImageView.frame.size = CGSize(width: 100, height: 150)
        mlModelFileImageView.alpha = 0.0
        view.addSubview(mlModelFileImageView)
        mlModelFileImageView.center = view.center
        
        //initialising iPhoneImageView as UIImageView
        let iphoneImageView = UIImageView()
        iphoneImageView.image = UIImage(named : "iPhone.png")
        iphoneImageView.frame.size = CGSize(width: 120, height: 200)
        iphoneImageView.alpha = 0.0
        view.addSubview(iphoneImageView)
        iphoneImageView.center = view.center
        
        //animating mmlRobotImageView i.e scaling mlRobotImageView to 10% of its size
        UIView.animate(withDuration: 1.0, animations: {
            mlRobotImageView.frame.size = CGSize(width: 22.5, height: 37.5)
            mlRobotImageView.center = view.center
        }) { (true) in
            
            // removing mlRobotImageView from superview
            mlRobotImageView.removeFromSuperview()
            
            UIView.animate(withDuration: 1.0, animations: {
                // changing alpha of modelFileImageView from 0.0 to 1.0
                modelFileImageView.alpha = 1.0
                
            }, completion: { (true) in
                // animating modelFileImageView i.e scaling modelFileImageView to 10% of its size
                UIView.animate(withDuration: 1.0, animations: {
                    modelFileImageView.frame.size = CGSize(width: 10, height: 15)
                    modelFileImageView.center = view.center
                    
                }, completion: { (true) in
                    //removing modelFileImageView from superview
                    modelFileImageView.removeFromSuperview()
                    
                    UIView.animate(withDuration: 1.0, animations: {
                        // changing alpha of coreMLImageView from 0.0 to 1.0
                        coreMLImageView.alpha = 1.0
                        
                    }, completion: { (true) in
                        
                        UIView.animate(withDuration: 1.0, animations: {
                            // animating coreMLImageView i.e scaling
                            coreMLImageView.frame.size = CGSize(width: 12.5, height: 12.5)
                            coreMLImageView.center = view.center
                            
                        }, completion: { (true) in
                            
                            UIView.animate(withDuration: 1.0, animations: {
                                // removing coreMLImageView from superview
                                coreMLImageView.removeFromSuperview()
                            }, completion: { (true) in

                                UIView.animate(withDuration: 1.0, animations: {
                                    // changing alpha of mlModelFileImageView from 0.0 to 1.0
                                    mlModelFileImageView.alpha = 1.0
                                    
                                }, completion: { (true) in
                                    
                                    UIView.animate(withDuration: 1.0, animations: {
                                        //scaling mlModelFileImageView to its 10%
                                        mlModelFileImageView.frame.size = CGSize(width: 10, height: 15)
                                        mlModelFileImageView.center = view.center
                                        
                                    }, completion: { (true) in
                                        
                                        UIView.animate(withDuration: 1.0, animations: {
                                            //removing mlModelFileImageView from superview
                                            mlModelFileImageView.removeFromSuperview()
                                            
                                        }, completion: { (true) in
                                            
                                            UIView.animate(withDuration: 1.0, animations: {
                                                //changing alpha of iphoneImageView from 0.0 to 1.0
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
        
        // equating liveView to custom view
        PlaygroundPage.current.liveView = view
        

    }
}
