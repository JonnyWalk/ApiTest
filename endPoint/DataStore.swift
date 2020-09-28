//
//  DataStore.swift
//  endPoint
//
//  Created by Jonny Walker on 27/09/2020.
//

import SwiftUI

class DataStore: ObservableObject{
    
    @Published var posts:[Post] = []
      
       
       init(){
           getPosts()
       }
       
       func getPosts(){
           Api().getPosts { (posts) in
               self.posts = posts
           }
       }
   }
