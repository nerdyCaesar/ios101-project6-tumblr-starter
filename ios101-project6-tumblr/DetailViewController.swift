//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Piyush Belbase on 09/04/2025.
//

import UIKit
import Nuke


class DetailViewController: UIViewController {
    
    var post: Post!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Post Details"
            
            if let post = post {
                textView.text = post.caption.trimHTMLTags()

                // Load image using Nuke
                if let urlString = post.photos.first?.originalSize.url
                {
                    Nuke.loadImage(with: urlString, into: imageView)
                }
                
            } else {
                print("⚠️ post is nil")
            }

        
        guard let post = post else {
            print("post is null")
            return
        }
        

        // Set the text, stripping HTML tags
        textView.text = post.caption.trimHTMLTags()

        // Load image using Nuke
        if let photo = post.photos.first {
            print("✅ Image URL: \(photo.originalSize.url)")
            Nuke.loadImage(with: photo.originalSize.url, into: imageView)
        } else {
            print("no photos found")
        }
        
        
        
        

        // Do any additional setup after loading the view.
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
