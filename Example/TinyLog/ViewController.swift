//
//  ViewController.swift
//  TinyLog
//
//  Created by DragonCherry on 01/11/2017.
//  Copyright (c) 2017 DragonCherry. All rights reserved.
//

import UIKit
import TinyLog

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        log("Printing default log, and it's regarded as verbose log.")
        logi("Printing information log.")
        logv("Printing verbose log.")
        logd("Printing debug log.")
        logw("Printing warning log.")
        loge("Printing error log.")
        logc("Printing critical log.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

