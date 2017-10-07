class Comment < ActiveRecord::Base
  belongs_to :leaved_to, polymorphic: true
  belongs_to :user
end
