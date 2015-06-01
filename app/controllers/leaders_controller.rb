class LeadersController < ApplicationController

  def new
    @voter_district = VoterDistrict.new
  end

  def create
    render action: "index"
  end

  def index
    @leaders = ObjectSpace.each_object(Leader).to_a
  end
end
