class LivestreamsController < ApplicationController
	include ActionController::Live

  def live_stream
	  response.headers["Content-Type"] = "text/event-stream"
  	
	  loop do
	  	response.stream.write "foo\n"
	  	sleep 1
	  end

  rescue IOError
    puts "Stream closed"
  ensure
    response.stream.close
  end
end
