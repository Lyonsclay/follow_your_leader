class LeadersController < ApplicationController

  def new
    @voter_district = VoterDistrict.new
  end

  def create
    address = params[:voter_district][:address]

    @leaders = Rails.cache.fetch("leaders/#{address}", expires_in: 2.days) do
      RepsGetter.new(address).get
    end

    render action: "index"
  end

  def index
    byebug
  end
end
