//
//  Navigation.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import Foundation
import UIKit

//MARK: - Storyboards
struct storyBoards {
    static let Main = UIStoryboard(name: "Main", bundle: Bundle.main)
    static let Profile = UIStoryboard(name: "Profile", bundle: Bundle.main)
    static let Chat = UIStoryboard(name: "Chat", bundle: Bundle.main)
    static let Match = UIStoryboard(name: "Match", bundle: Bundle.main)
    static let TabBar = UIStoryboard(name: "TabBar", bundle: Bundle.main)
}

//MARK: - purpleButton class//////
class PurpleButton: UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.init(named: "upperGradientColor")
        self.setTitleColor(UIColor.white, for: .normal)
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}

//MARK: - roundView class//////
class RoundView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    private func setup() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
    }
}

//MARK: - grayborderview class//////
class GrayBorderView:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    private func setup() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor(named: "buttonColor")?.cgColor
        self.layer.borderWidth = 1
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
//MARK: - dashed view////////////
class DashedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [4,4]
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: self.frame.width-20, y: 0)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
  
}
//MARK: - Current time function
func currentTime() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.dateFormat = "h:mm a"
    dateFormatter.amSymbol = "AM"
    dateFormatter.pmSymbol = "PM"
    return dateFormatter.string(from: date)
}


//MARK: - calculate age of user
func calculateAge(birthday: String) -> Int{
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let birthdayDate = dateFormater.date(from: birthday)
//    dateFormater.dateFormat = "dd-mm-yyyy"
    let calendar: NSCalendar! = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
    let now: NSDate! = NSDate()
    let calcAge = calendar.components(.year, from: birthdayDate!, to: now as Date, options: [])
    let age = calcAge.year
    return age!
}



//MARK: - user id and tokens
    func getUserToken() -> String {
        let token = UserDefaults.standard.value(forKey: "token") as? String ?? ""
        return token
    }
    
    func getUserId()->String{
        let userId = UserDefaults.standard.value(forKey: "id") as? String ?? ""
        return userId
    }
//MARK: - BackGroundThread
extension DispatchQueue {

    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }

}
