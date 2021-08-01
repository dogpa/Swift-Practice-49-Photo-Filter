//
//  ViewController.swift
//  Swift Practice # 49 Photo Filter
//
//  Created by CHEN PEIHAO on 2021/8/1.
//

import UIKit
import CoreImage.CIFilterBuiltins

class ViewController: UIViewController {

    @IBOutlet weak var photoUIImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func fitlerChange(_ sender: UISlider) {
        //定義照片內容
        let photo = UIImage(named: "carriver")
        //將定義好的照片內容放入CIImage內
        let ciimage = CIImage(image: photo!)
        //使用CIFilter.colorMonochrome()功能指派給filter
        let filter = CIFilter.colorMonochrome()
        //剛剛指派完成的照片透過filter.inputImage指派
        filter.inputImage = ciimage
        //濾鏡的顏色決定為紅色
        filter.color = CIColor.red
        //濾鏡的強度透過slider決定
        filter.intensity = sender.value
        //將ciImage的狀態重新指派回給uiimage使用
        //先透過if let檢查是否有照片若無則不動作確保app不閃退
        if let showIntoImageView = filter.outputImage{
            let filterImage = UIImage(ciImage: showIntoImageView)
            photoUIImageView.image = filterImage
        }
    }
    
    
}

