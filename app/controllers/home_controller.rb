class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=33566&distance=20&API_KEY=62A8ECF3-0D29-41BE-997F-D31E4A91BC57'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    
    #Check for empty results array
    if @output.empty?
      @final_output = 'Error'
    elsif !@output
      @final_output = 'Error'
    else 
      @final_output = @output[0]['AQI']
    end

  end
end
