class PagesController < ApplicationController
	include Tubesock::Hijack

	def live_stream
		
	end

	def delayed
		sleep 5
	end

	def home
		hijack do |tubesock|
			tubesock.onopen do
				loop do
					sleep 1
	        tubesock.send_data "Foo"
	      end
      end
      tubesock.onmessage do |data|
        tubesock.send_data "You said: #{data}"
      end
		end	
	end
end
