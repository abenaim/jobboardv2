require 'httparty'

class HomeController < ApplicationController
  include HTTParty
  base_uri='http://api.careerbuilder.com'
  default_params :outputjson=>"true"

  def index
     response = self.class.get('http://api.careerbuilder.com/v1/jobsearch?developerkey=WDHL89T652CLGJ7MD555')
     @results = JSON.parse(response.response.body)
  end

  def show
    @jobdid =  params[:did]
    response = self.class.get('http://api.careerbuilder.com/v1/job?developerkey=WDHL89T652CLGJ7MD555&DID='+@jobdid)
    @job = JSON.parse(response.response.body)
  end


end
