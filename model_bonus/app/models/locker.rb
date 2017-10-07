class Locker < ActiveRecord::Base
  belongs_to :item
  enum size: [:small,:medium,:large]
end
