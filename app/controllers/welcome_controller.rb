class WelcomeController < ApplicationController
	def index
		@mail = Mymail.all.last
	end
end
