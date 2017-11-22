//
//  CalendarVC.swift
//  WProject
//
//  Created by WeiWei on 2017/11/17.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarVC: BaseViewController, FSCalendarDelegate {

    @IBOutlet weak var calendarView: FSCalendar!
    
    var selectDateArr = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = "档期设置"

        self.initSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initSubviews() {
        
        self.calendarView.delegate = self
        // 设置多选
        self.calendarView.allowsMultipleSelection = true
        
        // 设置日期颜色
        self.calendarView.appearance.selectionColor = UIColor(red: 93/255.0, green: 230/255.0, blue: 48/255.0, alpha: 1)
        self.calendarView.appearance.headerTitleColor = UIColor(red: 77/255.0, green: 77/255.0, blue: 77/255.0, alpha: 1)
        self.calendarView.appearance.weekdayTextColor = UIColor(red: 77/255.0, green: 77/255.0, blue: 77/255.0, alpha: 1)
        
        
        self.selectDateArr = ["2017-11-19","2017-11-11","2017-11-22"]
        
        for dateStr in selectDateArr {
            
            self.calendarView.select(self.getDateFromStr(dateStr: dateStr))
        }
    }
    
    func getDateFromStr(dateStr: String) -> Date {
        
        var date = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        date = formatter.date(from: dateStr) ?? Date()
        
        return date
    }
    
    func getStrFromDate(date: Date) -> String {
        
        var dateStr = String()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        dateStr = formatter.string(from: date)
        
        return dateStr
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        self.updateDateValues(dateArr: calendar.selectedDates)
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        self.updateDateValues(dateArr: calendar.selectedDates)
    }
    
    func updateDateValues(dateArr: [Date]) {
        
        self.selectDateArr = []
        for date in dateArr {
            
            self.selectDateArr.append(self.getStrFromDate(date: date))
        }
        
        self.selectDateArr.sort()
        
        print(self.selectDateArr)
    }
}
