class LeadersController < ApplicationController

  def new
    @voter_district = VoterDistrict.new
  end

  def create
    address = params[:voter_district][:address]

    query = Rails.cache.fetch("leaders/#{address}", expires_in: 2.days) do
      RepsGetter.new(address)
    end

    @parsed_address = query.parsed_address

    @leaders = query.get

    render action: "index"
  end

  def index
    byebug
  end
end
