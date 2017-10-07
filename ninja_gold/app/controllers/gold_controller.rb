class GoldController < ApplicationController
  def index
  	if not session.key?('gold')
  		session['gold'] = 0
  		session['activity'] = []
  	end
  end

  def farm
  	earned = rand(10..20)
  	session['gold'] += earned
  	session['activity'].push({text:"Earned #{earned} golds from the farm! (#{Time.now.strftime('%Y/%m/%d %I:%M %p')})",color:"green"})
	redirect_to "/"
  end

  def cave
  	earned = rand(5..10)
  	session['gold'] += earned
  	session['activity'].insert(0,{text:"Earned #{earned} golds from the cave! (#{Time.now.strftime('%Y/%m/%d %I:%M %p')})",color:"green"})
	redirect_to "/"
  end

  def house
  	earned = rand(2..5)
  	session['gold'] += earned
  	session['activity'].insert(0,{text:"Earned #{earned} golds from the house! (#{Time.now.strftime('%Y/%m/%d %I:%M %p')})",color:"green"})
  	redirect_to "/"
  end

  def casino
  	earned = rand(-50..50)
  	session['gold'] += earned
  	if earned > 0
	  	session['activity'].insert(0,{text:"Earned #{earned} golds from the casino! (#{Time.now.strftime('%Y/%m/%d %I:%M %p')})",color:"green"})
	  else
	  	session['activity'].insert(0,{text:"Entered a casino and lost #{0-earned} golds... Ouch.. (#{Time.now.strftime('%Y/%m/%d %I:%M %p')})",color:"red"})
  	end
  	redirect_to "/"
  end
end
