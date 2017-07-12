//
//  ViewController.swift
//  BirdInForest
//
//  Created by Tung on 6/23/17.
//  Copyright © 2017 Tung. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
        var bird = UIImageView()
        var audioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drawJungle()
        addBird()
        flyUpAndDown()
        playSong()
    }
    func drawJungle() {
        let background = UIImageView(image: UIImage(named: "jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .scaleAspectFill
        self.view.addSubview(background)
    }
    func addBird()
    {
        //frame co kieu CGRect
        bird = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 68))
        //Can chuyen cho mot mang gom cac anh, add doi tuong len view thi se repeat
        bird.animationImages  = [UIImage(named: "bird0.png")!,UIImage(named: "bird1.png")!,UIImage(named: "bird2.png")!,UIImage(named: "bird3.png")!,UIImage(named: "bird4.png")!,UIImage(named: "bird5.png")!]
        //Repeat vo tan =1 thi la lap 1 lan roi dung
        bird.animationRepeatCount = 0
        //toc do load anh
        bird.animationDuration = 1
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    func flyUpAndDown(){
        //animate for bird
        UIView.animate(withDuration: 4, animations: { 
            self.bird.center = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
        }, completion: {(finished) in
            //Bay nguoc tro lai
                //B1: Lat Bird
            self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 0))
                //B2: bay nguoc tro lai
            UIView.animate(withDuration: 5, animations: { 
                self.bird.center = CGPoint(x: 0, y: 0)
            }, completion: { (finished) in
                //B3: thiet lap lai chuyen dong ban dau (reset animation)
                self.bird.transform = CGAffineTransform.identity
                self.flyUpAndDown()
            })
        })
            
        }
    func playSong(){
        let filePath = Bundle.main.path(forResource: "A+ – Chào Mào Mái Hót", ofType: ".mp3")
        let url = URL(fileURLWithPath: filePath!)
        audioPlayer = try! AVAudioPlayer(contentsOf: url)
        audioPlayer.play()
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        audioPlayer.stop()
//    }
    }

