class WelcomeController < ApplicationController
	def index
		@mail = Mail.all.last
	end
end
