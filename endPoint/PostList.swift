//
//  PostList.swift
//  endPoint
//
//  Created by Jonny Walker on 27/09/2020.
//

import SwiftUI

struct PostList: View {
    @State var posts: [Post] = []
    var body: some View {
        
        List(posts) { post in
            VStack(alignment: .leading, spacing: 8){
                Text("Random Jokes").alignmentGuide(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Guide@*/.leading/*@END_MENU_TOKEN@*/, computeValue: { dimension in
                    100
                })
                Text(post.type).font(.system(.title, design: .serif)).bold()
                Text(post.setup).font(.system(.title3, design: .serif))
                Text(post.punchline)
            }
        }
                .onAppear{
                Api().getPosts { (posts) in
                    self.posts = posts

                    
                }
            }
        }
    }


struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
        
    }
}
