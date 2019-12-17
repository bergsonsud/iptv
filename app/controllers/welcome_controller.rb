class WelcomeController < ApplicationController
	def index
		@mail = Mail.last
	end
end
