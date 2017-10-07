class SayController < ApplicationController
  def hello
  	render text: "Saying Hello!"
  end

  def hello_to_joe
  	render text: "Saying Hello Joe!"
  end

  def hello_to_michael
  	redirect_to "/say/hello/joe"
  end

  def index
  	render text: "What do you want me to say???"
  end
end
