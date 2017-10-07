class Item < ActiveRecord::Base
	has_one :locker
	@@count = 0

	def self.store(name,size)
		@@count += 1
		item=Item.create(name:"#{name}",ticket:@@count.to_s)
		assign_locker(item.id,size)
		puts @@count
	end

	def self.pick_up(ticket)
		item=Item.find_by(ticket: ticket.to_s)
		if item
			locker=Locker.find_by(item:item)
			puts locker.id
			locker.item.delete
			locker.update(item:nil)
		end
	end


	private_class_method def self.assign_locker(num,size)
  		if size > 2
  			puts "there is no locker avilable"
  		else
  			locker = Locker.find_by(item:nil,size: size)
	  		if locker
	  			puts locker.id
	  			locker.update(item_id:num)
	  		else
	  			assign_locker(num,size+1)
			end
		end
	end
end
