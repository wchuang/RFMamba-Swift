//
//  ViewController.swift
//  RFMamba
//
//  Created by roy.cao on 2018/5/17.
//  Copyright © 2018年 RFMamba. All rights reserved.
//

import UIKit


class ViewController: UIViewController {



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        let url:URL = URL(string: "https://blog.ibireme.com/wp-content/uploads/2015/05/RunLoop_0.png")!
        
        let data = try? Data(contentsOf: url )
        
        let image = UIImageView.init(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        image.image = UIImage(data: data!)
        self.view.addSubview(image)
        
        RFMemoryCache.default().cacheImage(image.image!, url: "http://image.baidu.com")
        
        let a = RFMemoryCache.default().image(withURL: "http://image.baidu.com")
        print(a)
    }


}

