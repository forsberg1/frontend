class PagesController < ApplicationController
  def index
    @pages = Page.all
    @client_ip = request.remote_ip
    @remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
    @my_ip     = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_addr
    @ip_addr   = request.env['REMOTE_ADDR']
    @liveacces = Live.where(ip: @my_ip).where(access: 1)
    @liveAccess = false 
      @liveacces.each do |l| 
      @liveAccess = true 
    end
  end

  def show
    @client_ip = request.remote_ip
    @remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
    @my_ip     = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_addr
    @ip_addr   = request.env['REMOTE_ADDR']
    @liveacces = Live.where(ip: @my_ip).where(access: 1)
    @liveAccess = false 
      @liveacces.each do |l| 
      @liveAccess = true 
    end
    @page = Page.find(params[:id])
  end
  
  def mercury_update
    page = Page.find(params[:id])
    page.name = params[:content][:page_name][:value]
    page.content = params[:content][:page_content][:value]
    page.save!
    render text: ""
  end
end
