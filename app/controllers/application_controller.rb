class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :random_image
  
  def random_image
    require 'pathname'
    blacklist = [".", ".."]
    file_names = Dir.glob("public/assets/backgrounds/*")
    blacklist.each do |blacklisted|
      file_names.delete(blacklisted)
    end
    bg_full=file_names.shuffle.first
    @bg=Pathname.new(bg_full).basename
  end
end
