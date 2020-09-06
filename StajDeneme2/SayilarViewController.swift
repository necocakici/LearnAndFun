import UIKit
import AVFoundation

class SayilarViewController: UIViewController {
    var player: AVAudioPlayer!
    
    @IBOutlet weak var englishSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        englishSwitch.addTarget(self, action: #selector(ingilizceYap), for: .valueChanged)
        
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        if englishSwitch.isOn {
            playSoundEng(soundName: sender.currentTitle!)
        } else {
            playSound(soundName: sender.currentTitle!)
        }
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2), execute: {
        sender.alpha = 1
        })
    }
    
    func playSoundEng(soundName:String) {
     let url = Bundle.main.url(forResource: "\(soundName)eng", withExtension: "m4a")
     player = try! AVAudioPlayer(contentsOf: url!)
     player.play()
    }
    
    func playSound(soundName:String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "m4a")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
       }
    @objc func ingilizceYap(){
        if englishSwitch.isOn {
            title="Numbers!"
            self.navigationController?.navigationBar.backItem?.title = "Back"
        }
        else {
            title="Sayılar!"
            self.navigationController?.navigationBar.backItem?.title = "Geri"
        }
    }
    



}
