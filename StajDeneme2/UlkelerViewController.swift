import UIKit
import AVFoundation

class UlkelerViewController: UIViewController {
    var player: AVAudioPlayer!
    var soundTag: String!
    @IBOutlet weak var englishSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Ülkeler!"
        englishSwitch.addTarget(self, action: #selector(ingilizceYap), for: .valueChanged)
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        soundTag = String(sender.tag) + "u"
        if englishSwitch.isOn{
            playSoundEng(soundName: soundTag)
        }
        else{
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
             title="Countries!"
             self.navigationController?.navigationBar.backItem?.title = "Back"
             
         }
         else {
             title="Ülkeler!"
             self.navigationController?.navigationBar.backItem?.title = "Geri"
         }
     }
    
}
