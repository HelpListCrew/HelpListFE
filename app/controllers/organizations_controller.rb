class OrganizationsController < ApplicationController
  def index
    @organizations = HelpListFacade.new.get_organizations
  end

  def show
    @organization = HelpListFacade.new.get_organization(params[:id])
  end
end