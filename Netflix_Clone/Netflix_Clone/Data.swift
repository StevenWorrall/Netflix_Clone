//
//  Data.swift
//  Netflix_Clone
//
//  Created by Steven Worrall on 2/25/20.
//  Copyright © 2020 StevenWorrall. All rights reserved.
//

import Foundation
import UIKit

let defaultImage = UIImage.from(color: .gray)

struct Data {
    var objectsArray = [
        TableViewCellModel(
            category: "Continue Watching",
            sectionType: .circle,
            videos: [
                CollectionViewCellModel(image: UIImage(named: "babies_background_logo") ?? defaultImage, name: "Babies"),
                CollectionViewCellModel(image: UIImage(named: "cats_background_logo") ?? defaultImage, name: "Don't F**k With Cats"),
                CollectionViewCellModel(image: UIImage(named: "chef_background_logo") ?? defaultImage, name: "The Chef Show"),
                CollectionViewCellModel(image: UIImage(named: "f1_background_logo") ?? defaultImage, name: "Formula 1 Drive to Survive"),
                CollectionViewCellModel(image: UIImage(named: "irishman_background_logo") ?? defaultImage, name: "The Irishman")
        ]),
        TableViewCellModel(
            category: "Trending Now",
            sectionType: .square,
            videos: [
                CollectionViewCellModel(image: UIImage(named: "money_background_logo") ?? defaultImage, name: "Money Heist"),
                CollectionViewCellModel(image: UIImage(named: "narcos_background_logo") ?? defaultImage, name: "Narcos"),
                CollectionViewCellModel(image: UIImage(named: "narcos_mexico_background_logo") ?? defaultImage, name: "Narcos Mexico"),
                CollectionViewCellModel(image: UIImage(named: "night_background_logo") ?? defaultImage, name: "Night on Earth")
        ]),
        TableViewCellModel(
            category: "New Releases",
            sectionType: .square,
            videos: [
                CollectionViewCellModel(image: UIImage(named: "okay_background_logo") ?? defaultImage, name: "I am Not Okay With This"),
                CollectionViewCellModel(image: UIImage(named: "peaky_background_logo") ?? defaultImage, name: "Peaky Blinders"),
                CollectionViewCellModel(image: UIImage(named: "pharmacist_background_logo") ?? defaultImage, name: "The Pharmacist"),
                CollectionViewCellModel(image: UIImage(named: "rotton_background_logo") ?? defaultImage, name: "Rotton"),
                CollectionViewCellModel(image: UIImage(named: "sex_education_background_logo") ?? defaultImage, name: "Sex Education")
        ]),
        TableViewCellModel(
            category: "Netflix Originals",
            sectionType: .square,
            videos: [
                CollectionViewCellModel(image: UIImage(named: "trials_background_logo") ?? defaultImage, name: "The Trials of Gabriel Fernandez "),
                CollectionViewCellModel(image: UIImage(named: "ww2_background_logo") ?? defaultImage, name: "Greatest Events of WW2"),
                CollectionViewCellModel(image: UIImage(named: "you_background_logo") ?? defaultImage, name: "You"),
                CollectionViewCellModel(image: UIImage(named: "narcos_background_logo") ?? defaultImage, name: "Narcos"),
                CollectionViewCellModel(image: UIImage(named: "narcos_mexico_background_logo") ?? defaultImage, name: "Narcos Mexico")
        ]),
        TableViewCellModel(
            category: "Top Picks For You",
            sectionType: .square,
            videos: [
                CollectionViewCellModel(image: UIImage(named: "okay_background_logo") ?? defaultImage, name: "I am Not Okay With This"),
                CollectionViewCellModel(image: UIImage(named: "peaky_background_logo") ?? defaultImage, name: "Peaky Blinders"),
                CollectionViewCellModel(image: UIImage(named: "pharmacist_background_logo") ?? defaultImage, name: "The Pharmacist"),
                CollectionViewCellModel(image: UIImage(named: "rotton_background_logo") ?? defaultImage, name: "Rotton"),
                CollectionViewCellModel(image: UIImage(named: "chef_background_logo") ?? defaultImage, name: "The Chef Show"),
                CollectionViewCellModel(image: UIImage(named: "f1_background_logo") ?? defaultImage, name: "Formula 1 Drive to Survive")
        ]),
        TableViewCellModel(
            category: "Popular on Netflix",
            sectionType: .square,
            videos: [
                CollectionViewCellModel(image: UIImage(named: "trials_background_logo") ?? defaultImage, name: "The Trials of Gabriel Fernandez "),
                CollectionViewCellModel(image: UIImage(named: "ww2_background_logo") ?? defaultImage, name: "Greatest Events of WW2"),
                CollectionViewCellModel(image: UIImage(named: "you_background_logo") ?? defaultImage, name: "You"),
                CollectionViewCellModel(image: UIImage(named: "babies_background_logo") ?? defaultImage, name: "Babies"),
                CollectionViewCellModel(image: UIImage(named: "cats_background_logo") ?? defaultImage, name: "Don't F**k With Cats")
        ])
    ]
}
