class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @display_foot = true
  end
end
