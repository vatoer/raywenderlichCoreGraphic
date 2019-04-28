//
//  CalendarVars.swift
//  raywenderlichCoreGraphic
//
//  Created by mac si on 26/04/19.
//  Copyright © 2019 fathur rohman. All rights reserved.
//

import Foundation

let date = Date()
let sysCalendar = Calendar.current

var day = sysCalendar.component(.day , from: date)
var weekday = sysCalendar.component(.weekday, from: date)
var month = sysCalendar.component(.month, from:date) - 1
var year = sysCalendar.component(.year, from: date)

