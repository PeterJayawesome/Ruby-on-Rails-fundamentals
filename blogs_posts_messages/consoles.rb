# create 5 new blogs.
5.times{|i| Blog.create(name:"Test Blog #{i.to_s}",description:"this is a test blog")}
# create several posts for each blog.
Blog.all.each{|blog| 3.times{|i| blog.posts.create(title:"Test Post #{i.to_s}",content:"this is a test post")}}
# create several messages for the first post.
4.times{|i| Post.first.messages.create(author:"Author #{i.to_s}",message:"this is a test message")}
# know how to retrieve all posts for the first blog.
Blog.first.posts
# know how to retrieve all posts for the last blog (sorted by title in the DESC order).
Blog.last.posts.order(title: :desc)
# know how to update the first post's title.
Post.first.update(title:"Title Updated")
# know how to delete the third post (have the model automatically delete all messages 
# associated with the third post when you delete the third post).
Post.find(3).delete
# know how to retrieve all blogs.
Blog.all
# know how to retrieve all blogs whose id is less than 5.
Blog.where("id<?",5)