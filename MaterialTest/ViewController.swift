//
//  ViewController.swift
//  MaterialTest
//
//  Created by Gareth.K.Mensah on 2/4/17.
//  Copyright © 2017 Gareth.K.Mensah. All rights reserved.
//

import UIKit
import Material

class ViewController: UIViewController, MenuDelegate {
    
    fileprivate var menu: Menu
    
    required init?(coder aDecoder: NSCoder) {
        self.menu = Menu(frame: CGRect(x: 100, y: 400, width: 40, height: 40))
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMenu()
    }
    
    func handleMenu() {
        if self.menu.isOpened == false { self.menu.open() { (v: UIView) in (v as? Button)?.pulse() }
        } else { self.menu.close() }
    }
    
    func loadMenu() {
        let btn1: FabButton = FabButton()
        btn1.depthPreset = .depth2
        btn1.pulseAnimation = .centerWithBacking
        btn1.backgroundColor = Color.lightGray
        btn1.tintColor = Color.blue
        btn1.addTarget(self, action: #selector(self.handleMenu), for: .touchUpInside)
        
        let btn2: FabButton = FabButton()
        btn2.tag = 1
        btn2.contentMode = .scaleToFill
        btn2.depthPreset = .depth1
        btn2.pulseColor = Color.white
        btn2.backgroundColor = Color.indigo.darken1
        btn2.tintColor = Color.red
        btn2.borderWidth = 2
        
        let btn3: FabButton = FabButton()
        btn3.tag = 2
        btn3.contentMode = .scaleToFill
        btn3.depthPreset = .depth1
        btn3.backgroundColor = Color.lightBlue.base
        btn3.pulseColor = Color.white
        btn3.borderColor = Color.white
        btn3.borderWidth = 2
        
        menu.direction = .up
        menu.delegate = self
        menu.views = [btn1, btn2, btn3]
        self.view.addSubview(menu)
    }
}

