import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var sayilarButton: UIButton!
    @IBOutlet weak var renklerButton: UIButton!
    @IBOutlet weak var hayvanlarButton: UIButton!
    @IBOutlet weak var sekillerButton: UIButton!
    @IBOutlet weak var englishSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }


}
