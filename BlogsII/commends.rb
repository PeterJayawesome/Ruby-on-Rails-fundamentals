# Create 5 users  
5.times{|i| User.create(first_name:"User#{i.to_s}",last_name:"Jiang",email_address:"test@test.com")}
# Create 5 blogs  
5.times{|i| Blog.create(name:"Blog#{i.to_s}",description:"this is a test blog")}
# Have the first 3 blogs be owned by the first user  
User.first.blogs<<Blog.all.limit(3)
# Have the 4th blog you create be owned by the second user  
Blog.find(4).users<<User.second
# Have the 5th blog you create be owned by the last user  
Blog.find(5).users<<User.last
# Have the third user own all of the blogs that were created.  
User.all[2].blogs<<Blog.all
# Have the first user create 3 posts for the blog with an id of 2. Remember 
# that you shouldn't do Post.create(user: User.first, blog_id: 2) but more 
# like Post.create(user: User.first, blog: Blog.find(2)). Again, you should 
# never reference the foreign key in Rails.  
3.times{User.first.posts.create(blog:Blog.find(2),title:"Test Post",content:"this is a test post")}
# Have the second user create 5 posts for the last Blog.  
5.times{User.second.posts.create(blog:Blog.last,title:"Test Post",content:"this is a test post")}
# Have the 3rd user create several posts for different blogs. 
5.times{User.third.posts.create(blog:Blog.find(rand(1..5)),title:"Test Post",content:"this is a test post")}
# Have the 3rd user create 2 messages for the first post created and 3 
# messages for the second post created  
2.times{User.third.messages.create(post:Post.first,author:"Peter",message:"test message")}
3.times{User.third.messages.create(post:Post.second,author:"Peter",message:"test message")}
# Have the 4th user create 3 messages for the last post you created.  
3.times{User.find(4).messages.create(post:Post.last,author:"Peter",message:"test message")}
# Change the owner of the 2nd post to the last user.  
Post.second.update(user:User.last)
# Change the 2nd post's content to be something else.  
Post.second.update(content:"this is test post ^O^")
# Retrieve all blogs owned by the 3rd user (make this work by simply 
# doing: User.find(3).blogs).  
User.find(3).blogs
# Retrieve all posts that were created by the 3rd user  
User.find(3).posts
# Retrieve all messages left by the 3rd user  
User.find(3).messages
# Retrieve all posts associated with the blog id 5 as well as who left 
# these posts.  
Blog.find(5).posts.select("posts.id, users.first_name").joins(:user)
# Retrieve all messages associated with the blog id 5 along with all 
# the user information of those who left the messages  
Message.joins(:user).where(post: Blog.find(5).posts).select("*")
# Grab all user information of those that own the first blog (make this 
# work by allowing Blog.first.owners to work).  
Blog.first.owners.select("users.*").joins(:user)
# Change it so that the first blog is no longer owned by the first user.
Blog.first.users.delete(User.first)





# We're going to add another model (Comment) to our Blogs/Posts/Messages assignment.
rails g model Comment comments:string leaved_to:references{polymorphic} user:references