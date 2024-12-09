//
//  LandingViewController.swift
//  BookStore
//
//  Created by Bell Dien on 2024/12/8.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func autoLayout(_ sender: Any) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BookListViewController")
        
        // viewController.modalPresentationStyle = .fullScreen
        // self.present(viewController, animated: true) { }
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func manualLayout(_ sender: Any) {
        let viewController = MBookListViewController.init()
        
        self.navigationController?.pushViewController(viewController, animated: true)
        //self.present(viewController, animated: true) { }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
