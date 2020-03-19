//
//  Data.swift
//  Landmarks
//
//  Created by Jae Ki Lee on 2020/03/18.
//  Copyright © 2020 Jae Ki Lee. All rights reserved.
//

import UIKit
import SwiftUI
import CoreLocation

let landmarkData: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    //파일 이름을 입력받는다.
    
    let data: Data
    
    //번들 메인에서 파일이름 으로 데이터를 찾는다.(Targets/Build Phasses/Copy Bundle Resouces)
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    //파일을 데이터로 변환한다.
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    //decode 한 데이터를 반환한다.
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    //Stirng 을 키로 가지고, image 를 값으로 가진 사전을 선언한다.
    typealias _ImageDictionary = [String : CGImage]
    fileprivate var  images: _ImageDictionary = [:]
    
    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }
    
    //메인 번들에 있는 이미지 파일을 CGImage 객체로 변환하여 가져온다.
    static func loadImage(name: String) -> CGImage {
        guard
            //메인 번들에 있는 이미지의 url 을 가져온다.
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            //url 을 imageSource 로 가져온다.
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            //imageSource 를 image 로 변환한다.
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        //image 를 반환한다.
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        //딕셔너리 객체에서 이름에 대한 이미지를 가져온다.
        if let index = images.index(forKey: name) { return index }
        //딕셔너리 객체에서 이름에 대한 이미지를 loadImage 를 이용해 확실히 대체한다.
        images[name] = ImageStore.loadImage(name: name)
        //이미지를 리턴한다.
        return images.index(forKey: name)!
    }
}


