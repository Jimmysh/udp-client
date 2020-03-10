import Network
import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@available(iOS 12.0, *)
@objc(UDPClient)
public class UDPClient: CAPPlugin {
    var host = "";
    var port = 12345;
    
    var connection: NWConnection?
    
    @objc func setup(_ call: CAPPluginCall) {
        host = call.getString("host") ?? ""
        port = call.getInt("port") ?? 12345
        connection = NWConnection(host:NWEndpoint.Host.name(host,nil),port: NWEndpoint.Port(rawValue: UInt16(port))!, using: .udp)
        connection?.stateUpdateHandler = self.stateDidChange(to:)
        let connectionQueue = DispatchQueue(label: "networkPlayground.sender")
        connection?.start(queue:connectionQueue)
        call.resolve()

    }
    
    @objc func send(_ call:CAPPluginCall){
        if(connection != nil){
            let msg = call.getString("value") ?? ""
            connection?.send(content: msg.data(using: .utf8)!, completion: .contentProcessed({ sendError in
            if let error = sendError {
                call.reject("Failed, error: \(error)")
                self.connectionDidFail(error: error)
            } else {
                call.resolve([
                    "success":true
                ])
            }
        }))}else{
            self.notifyListeners("error", data:[
                "error":"未连接"
                ])
            call.reject("未连接")
        }
    }
    

    func stateDidChange(to state: NWConnection.State) {
        switch state {
        case .setup:
            break
        case .waiting(let error):
            self.connectionDidFail(error: error)
        case .preparing:
            print("Preparing")
            self.notifyListeners("stateChange", data:[
                "state":"Preparing"
                ])
        case .ready:
            print("Connected")
            self.notifyListeners("stateChange", data:[
                "state":"Connected"
                ])
        case .failed(let error):
            self.connectionDidFail(error: error)
        case .cancelled:
            break
        }
    }
    
    func connectionDidFail(error: Error) {
            print("Failed, error: \(error)")
            self.notifyListeners("error", data:[
            "error":"\(error)"
            ])   
            if connection?.stateUpdateHandler != nil {
            connection?.stateUpdateHandler = nil
            connection?.cancel()
        }
    }
}
