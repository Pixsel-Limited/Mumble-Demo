//
//  ViewController.swift
//  Mumble Client
//
//  Created by Hunaid Hassan on 18/12/2019.
//

import UIKit
import MumbleKit

class ViewController: UIViewController {
    @IBOutlet public var hostTextField: UITextField!
    @IBOutlet public var portTextField: UITextField!
    
    private var connection: MKConnection?
    private var serverModel: MKServerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func connectDidPress() {
        connection = MKConnection()
        connection?.setForceTCP(true)
        connection?.setDelegate(self)
        serverModel = MKServerModel(connection: connection)
        serverModel?.addDelegate(self)
        connection?.connect(toHost: hostTextField.text, port: UInt(portTextField.text ?? "") ?? 80)
    }
}

extension ViewController: MKConnectionDelegate {
    func connectionOpened(_ conn: MKConnection!) {
        print("connection opened")
    }
    
    func connection(_ conn: MKConnection!, unableToConnectWithError err: Error!) {
        print("error")
        print(err.localizedDescription)
    }
    
    func connection(_ conn: MKConnection!, closedWithError err: Error!) {
        print("closed")
    }
    
    func connection(_ conn: MKConnection!, trustFailureInCertificateChain chain: [Any]!) {
        print("trust error")
    }
    
    func connection(_ conn: MKConnection!, rejectedWith reason: MKRejectReason, explanation: String!) {
        print("rejected")
    }
}

extension ViewController: MKServerModelDelegate {
    func serverModel(_ model: MKServerModel!, joinedServerAs user: MKUser!) {
        
    }
}
