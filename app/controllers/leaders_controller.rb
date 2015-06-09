class LeadersController < ApplicationController

  def new
    @voter_district = VoterDistrict.new
  end

  def create
    address = params[:voter_district][:address]
    @leaders = Leader.all
    render action: "index"
  end

  def index
  end
end
