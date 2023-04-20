class OrganizationsController < ApplicationController
  before_action :set_user

  def show
    @organization = HelpListFacade.new.get_organization(params[:id])
  end

  private
  def set_user
   @user = current_user
  end
end