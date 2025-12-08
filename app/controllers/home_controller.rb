class HomeController < ApplicationController
  def home_display
    render({ :template => "home_templates/display" })
  end
end
