//
//  playWithRobotViewController.swift
//  Serial
//
//  Created by Raul Marchis on 26/12/2019.
//  Copyright © 2019 Balancing Rock. All rights reserved.
//

import UIKit
import CoreBluetooth
import QuartzCore

class playWithRobotViewController: UIViewController, BluetoothSerialDelegate {
    
    func serialDidChangeState() {
    }
    
    func serialDidDisconnect(_ peripheral: CBPeripheral, error: NSError?) {
    }
    
    
    
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBAction func exitButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //serial = BluetoothSerial(delegate: self)
        setupButtons()
    }
    
    private func setupButtons() {
        let lpforward = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressForward))
        lpforward.minimumPressDuration = 0.5
        lpforward.delaysTouchesBegan = true
        forwardButton.addGestureRecognizer(lpforward)
        
        let lpbackward = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressBackward))
        lpbackward.minimumPressDuration = 0.5
        lpbackward.delaysTouchesBegan = true
        downButton.addGestureRecognizer(lpbackward)
        
        let lpleft = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressLeft))
        lpleft.minimumPressDuration = 0.5
        lpleft.delaysTouchesBegan = true
        leftButton.addGestureRecognizer(lpleft)
        
        let lpright = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressRight))
        lpright.minimumPressDuration = 0.5
        lpright.delaysTouchesBegan = true
        rightButton.addGestureRecognizer(lpright)
    }
    
    //MARK: - UILongPressGestureRecognizer Action -
    @objc func handleLongPressForward(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            if !serial.isReady {
                let alert = UIAlertController(title: "Not connected", message: "What am I supposed to send this to?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: { action -> Void in self.dismiss(animated: true, completion: nil) }))
                present(alert, animated: true, completion: nil)
            } else {
                let pref = UserDefaults.standard.integer(forKey: MessageOptionKey)
                var msg = "F"
                switch pref {
                case MessageOption.newline.rawValue:
                    msg += "\n"
                case MessageOption.carriageReturn.rawValue:
                    msg += "\r"
                case MessageOption.carriageReturnAndNewline.rawValue:
                    msg += "\r\n"
                default:
                    msg += ""
                }
                serial.sendMessageToDevice(msg)
            }
        }
        else {
            let pref = UserDefaults.standard.integer(forKey: MessageOptionKey)
            var msg = "S"
            switch pref {
            case MessageOption.newline.rawValue:
                msg += "\n"
            case MessageOption.carriageReturn.rawValue:
                msg += "\r"
            case MessageOption.carriageReturnAndNewline.rawValue:
                msg += "\r\n"
            default:
                msg += ""
            }
            serial.sendMessageToDevice(msg)
        }
    }
    
    
    @objc func handleLongPressBackward(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            if !serial.isReady {
                let alert = UIAlertController(title: "Not connected", message: "What am I supposed to send this to?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: { action -> Void in self.dismiss(animated: true, completion: nil) }))
                present(alert, animated: true, completion: nil)
            } else {
                let pref = UserDefaults.standard.integer(forKey: MessageOptionKey)
                var msg = "B"
                switch pref {
                case MessageOption.newline.rawValue:
                    msg += "\n"
                case MessageOption.carriageReturn.rawValue:
                    msg += "\r"
                case MessageOption.carriageReturnAndNewline.rawValue:
                    msg += "\r\n"
                default:
                    msg += ""
                }
                serial.sendMessageToDevice(msg)
            }
        }
        else {
            let pref = UserDefaults.standard.integer(forKey: MessageOptionKey)
            var msg = "S"
            switch pref {
            case MessageOption.newline.rawValue:
                msg += "\n"
            case MessageOption.carriageReturn.rawValue:
                msg += "\r"
            case MessageOption.carriageReturnAndNewline.rawValue:
                msg += "\r\n"
            default:
                msg += ""
            }
            serial.sendMessageToDevice(msg)
        }
    }
    
    @objc func handleLongPressLeft(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            if !serial.isReady {
                let alert = UIAlertController(title: "Not connected", message: "What am I supposed to send this to?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: { action -> Void in self.dismiss(animated: true, completion: nil) }))
                present(alert, animated: true, completion: nil)
            } else {
                let pref = UserDefaults.standard.integer(forKey: MessageOptionKey)
                var msg = "L"
                switch pref {
                case MessageOption.newline.rawValue:
                    msg += "\n"
                case MessageOption.carriageReturn.rawValue:
                    msg += "\r"
                case MessageOption.carriageReturnAndNewline.rawValue:
                    msg += "\r\n"
                default:
                    msg += ""
                }
                serial.sendMessageToDevice(msg)
            }
        }
        else {
            let pref = UserDefaults.standard.integer(forKey: MessageOptionKey)
            var msg = "S"
            switch pref {
            case MessageOption.newline.rawValue:
                msg += "\n"
            case MessageOption.carriageReturn.rawValue:
                msg += "\r"
            case MessageOption.carriageReturnAndNewline.rawValue:
                msg += "\r\n"
            default:
                msg += ""
            }
            serial.sendMessageToDevice(msg)
        }
    }
    
    @objc func handleLongPressRight(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            if !serial.isReady {
                let alert = UIAlertController(title: "Not connected", message: "What am I supposed to send this to?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: { action -> Void in self.dismiss(animated: true, completion: nil) }))
                present(alert, animated: true, completion: nil)
            } else {
                let pref = UserDefaults.standard.integer(forKey: MessageOptionKey)
                var msg = "R"
                switch pref {
                case MessageOption.newline.rawValue:
                    msg += "\n"
                case MessageOption.carriageReturn.rawValue:
                    msg += "\r"
                case MessageOption.carriageReturnAndNewline.rawValue:
                    msg += "\r\n"
                default:
                    msg += ""
                }
                serial.sendMessageToDevice(msg)
            }
        }
        else {
            let pref = UserDefaults.standard.integer(forKey: MessageOptionKey)
            var msg = "S"
            switch pref {
            case MessageOption.newline.rawValue:
                msg += "\n"
            case MessageOption.carriageReturn.rawValue:
                msg += "\r"
            case MessageOption.carriageReturnAndNewline.rawValue:
                msg += "\r\n"
            default:
                msg += ""
            }
            serial.sendMessageToDevice(msg)
        }
    }
}
