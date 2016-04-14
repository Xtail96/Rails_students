class HelloController < ApplicationController
	def hello
		@var = Hello.start
	end
end