import UIKit
import AVFoundation

class RenklerViewController: UIViewController {
    var player: AVAudioPlayer!
    var soundTag: String = ""
    @IBOutlet weak var englishSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Renkler!"
        englishSwitch.addTarget(self, action: #selector(ingilizceYap), for: .valueChanged)
    }
    @IBAction func keyPressed(_ sender: UIButton) {
        soundTag = String(sender.tag) + "r"
        if englishSwitch.isOn{
            title="Colors!"
            playSoundEng(soundName: soundTag)
        }
        else{
            title="Renkler!"
            playSound(soundName: soundTag)
        }
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2), execute: {
        sender.alpha = 1
        })
    }
    
    func playSound(soundName:String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "m4a")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
       }
    func playSoundEng(soundName:String) {
     let url = Bundle.main.url(forResource: "\(soundName)eng", withExtension: "m4a")
     player = try! AVAudioPlayer(contentsOf: url!)
     player.play()
                
    }
    @objc func ingilizceYap(){
        if englishSwitch.isOn {
            title="Colors!"
            self.navigationController?.navigationBar.backItem?.title = "Back"
        }
        else {
            title="Renkler!"
            self.navigationController?.navigationBar.backItem?.title = "Geri"
        }
    }
}
