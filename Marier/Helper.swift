//
//  Navigation.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import Foundation
import UIKit

//MARK: -date format
let dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sss'Z'"
//MARK: - Storyboards
struct storyBoards {
    static let Main = UIStoryboard(name: "Main", bundle: Bundle.main)
    static let Profile = UIStoryboard(name: "Profile", bundle: Bundle.main)
    static let Chat = UIStoryboard(name: "Chat", bundle: Bundle.main)
    static let Match = UIStoryboard(name: "Match", bundle: Bundle.main)
    static let TabBar = UIStoryboard(name: "TabBar", bundle: Bundle.main)
}
//MARK: - get gallery image

func getGalleryFirstImage(gallery: [UserGallery])->URL?{
        if gallery.isEmpty{
            return URL(string: "")
        }else{
            let img = gallery[0].image
            return URL(string: img)
        }
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
//MARK: -Gray borderButton
class GrayButton: UIButton{
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
        self.layer.borderColor = UIColor.init(named: "buttonColor")?.cgColor
        self.layer.borderWidth = 1
        self.setTitleColor(UIColor.black, for: .normal)
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
//MARK: - gradientButton
class GradientButton: UIButton{
    
    override func layoutSubviews() {
           super.layoutSubviews()
        self.setTitleColor(.white, for: .normal)
           gradientLayer.frame = bounds
       }
       private lazy var gradientLayer: CAGradientLayer = {
           let leftColor = UIColor(red: 118/255, green: 45/255, blue: 196/255, alpha: 1)
           let rightColor = UIColor(red: 118/255, green: 45/255, blue: 196/255, alpha: 0.56)
           let l = CAGradientLayer()
           l.frame = self.bounds
           l.colors = [leftColor.cgColor, rightColor.cgColor]
           l.startPoint = CGPoint(x: 0, y: 0.5)
           l.endPoint = CGPoint(x: 1, y: 0.5)
           l.cornerRadius = 25
           layer.insertSublayer(l, at: 0)
           return l
       }()
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
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
func messagesTime(dateTo:String) -> String {
    let dateToconvert = getCalenderDateFromString(aDate:dateTo)
  
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
//    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.dateFormat = "h:mm a"
    dateFormatter.amSymbol = "AM"
    dateFormatter.pmSymbol = "PM"
    return dateFormatter.string(from: dateToconvert)
}



//MARK: - getCalenderDateFromString//////
func getCalenderDateFromString(aDate : String) -> Date
{
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    formatter.timeZone = TimeZone(abbreviation: "UTC")

    return formatter.date(from: aDate)!
}
//MARK: - getDateofbirth

func getDob(aDate:String)->String{
   let date = getCalenderDateFromString(aDate: aDate)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date)
}
func getUTCDateFromString(aDate : String , aDateFormate : String) -> Date
{
    //    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = aDateFormate
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    return formatter.date(from: aDate)!
}

//MARK: - getCurrentDateInString//////
func getCurrentDateInString() -> String
{
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = dateFormat
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    return formatter.string(from:date)
}
//MARK: - getCalenderDateInString//////
func getCalenderDateInString(aDateFormate : String) -> String
{
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    return formatter.string(from:date)
}
//MARK: - UTCToLocalDateFormat//////
func UTCToLocalDateFormat(date: String) -> String {
   
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sss'Z'"
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    
    let dt = dateFormatter.date(from: date)
    dateFormatter.timeZone = TimeZone.current
//    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    var str = ""
    if dt != nil
    {
        str = dateFormatter.string(from: dt!)
    }
    return str
}



//MARK: - calculate age of user
func calculateAge(birthday: String) -> Int{
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sss'Z'"
    let birthdayDate = dateFormater.date(from: birthday)
    let now = Date()
    let calendar = Calendar.current
    let ageComponents = calendar.dateComponents([.year], from: birthdayDate ?? Date(), to: now)
    let age = ageComponents.year!
    return age
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


class IntrinsicTableView: UITableView {

    override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }

}
