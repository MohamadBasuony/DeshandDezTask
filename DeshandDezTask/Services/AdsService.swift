//
//  AdsService.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 26/11/2023.
//

import Foundation

class ApiAdsService {
    func getPersons() -> [PersonModel]{
        var persons = [PersonModel]()
        persons.append(PersonModel(name: "Amr Salama",image: "person3", job : "Film Director" , isFollowing: true , isFavorite: true))
        persons.append(PersonModel(name: "Ben Affleck",image: "person2", job : "American Actor" , isFollowing: false , isFavorite: true))
        persons.append(PersonModel(name: "Ana de Armas",image: "person1", job : "Spanish Actress" , isFollowing: true , isFavorite: true))
        return persons
    }
    
    func getCategories() -> [CategoryModel]{
        var categories = [CategoryModel]()
        categories.append(CategoryModel(name: "All Categories" , data: ["img1","img2","img3","img4"]))
        categories.append(CategoryModel(name: "Sport", data: ["img1","img2","img3","img4"]))
        categories.append(CategoryModel(name: "Cima", data: ["img3","img4","img1","img2"]))
        categories.append(CategoryModel(name: "Cars", data: ["img1","img2","img3","img4"]))
        categories.append(CategoryModel(name: "Fashion", data: ["img1","img2","img3","img4"]))
        categories.append(CategoryModel(name: "Real State", data: ["img1","img2","img3","img4"]))
        categories.append(CategoryModel(name: "Food", data: ["img1","img2","img3","img4"]))
        categories.append(CategoryModel(name: "Toon", data: ["img1","img2","img3","img4"]))
        categories.append(CategoryModel(name: "Anything", data: ["img1","img2","img3","img4"]))
        return categories
    }
}
