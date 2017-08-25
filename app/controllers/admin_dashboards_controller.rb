class AdminDashboardsController < ApplicationController
  def index
    @courses = Course.all
  end
end
