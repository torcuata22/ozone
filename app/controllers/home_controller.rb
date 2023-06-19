class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=33566 &distance=20&API_KEY=62A8ECF3-0D29-41BE-997F-D31E4A91BC57'
    @uri = URI(@url)

    begin
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)
    rescue StandardError => e
      puts "Error occurred: #{e.message}"
      @output = []
    end
   
    
    #Check for empty results array
    if @output.empty?
      @final_output = 'Error'
    elsif !@output
      @final_output = 'Error'
    else 
      @final_output = @output[0]['AQI']
    end

    if @final_output == "Error"
      @api_color="error"
    elsif @final_output.to_i <= 50
      @api_color="green"
      @api_description = "The air quality in your area is good"
    elsif @final_output.to_i >= 51 && @final_output <= 100
      @api_color="yellow"
      @api_description = "The air quality in your area is between 51 and 100, which means it is acceptable, but some pollutants may be a moderate health concern for sensitive people" 
    elsif @final_output.to_i >= 101 && @final_output <= 150
      @api_color="orange" 
      @api_description = "The air quality in your area is between 101 and 150, which means it is unhealthy for sensitive groups. People with lung disease, older adults, and children are at greater risk from exposure to ozone and particulates in the air" 
    elsif @final_output.to_i >= 151 && @final_output <= 200
      @api_color="red" 
      @api_description = "The air quality in your area is between 151 and 200, which means it is unhealthy and everyone may experience more serious health effects"
    elsif @final_output.to_i >= 201 && @final_output <= 300
      @api_color="purple"
      @api_description = "The air quality in your area is between 201 and 300, which means it is very unhealthy and everyone may experience health effects"
    elsif @final_output.to_i >= 301 && @final_output <= 500
      @api_color="maroon"  
      @api_description = "The air quality in your area is between 301 and 500, which means it is hazardous and the entire population is likely to be affected"
    end 
  end
 
  def zipcode
    @zip_query = params[:zipcode]  
     
    if params[:zipcode].blank?
        flash[:error] = "Hey, you forgot to enter a zip code"
        redirect_to root_path
    elsif params[:zipcode]
    #do API stuff:
    require 'net/http'
    require 'json'
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=' + @zip_query + '&distance=20&API_KEY=62A8ECF3-0D29-41BE-997F-D31E4A91BC57'
    @uri = URI(@url)

    begin
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)
    rescue StandardError => e
      puts "Error occurred: #{e.message}"
      @output = []
    end
   
    
    #Check for empty results array
    if @output.empty?
      @final_output = 'Error'
    elsif !@output
      @final_output = 'Error'
    else 
      @final_output = @output[0]['AQI']
    end

    if @final_output == "Error"
      @api_color="error"
    elsif @final_output.to_i <= 50
      @api_color="green"
      @api_description = "The air quality in your area is good"
    elsif @final_output.to_i >= 51 && @final_output <= 100
      @api_color="yellow"
      @api_description = "The air quality in your area is between 51 and 100, which means it is acceptable, but some pollutants may be a moderate health concern for sensitive people" 
    elsif @final_output.to_i >= 101 && @final_output <= 150
      @api_color="orange" 
      @api_description = "The air quality in your area is between 101 and 150, which means it is unhealthy for sensitive groups. People with lung disease, older adults, and children are at greater risk from exposure to ozone and particulates in the air" 
    elsif @final_output.to_i >= 151 && @final_output <= 200
      @api_color="red" 
      @api_description = "The air quality in your area is between 151 and 200, which means it is unhealthy and everyone may experience more serious health effects"
    elsif @final_output.to_i >= 201 && @final_output <= 300
      @api_color="purple"
      @api_description = "The air quality in your area is between 201 and 300, which means it is very unhealthy and everyone may experience health effects"
    elsif @final_output.to_i >= 301 && @final_output <= 500
      @api_color="maroon"  
      @api_description = "The air quality in your area is between 301 and 500, which means it is hazardous and the entire population is likely to be affected"
    end 




    end  
  end
end
