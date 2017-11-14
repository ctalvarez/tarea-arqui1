class HomeController < ApplicationController

  def index
    @ip = Request.create!(ip: request.remote_ip)
    @ips = Request.all
    render 'index'
  end
  
end
