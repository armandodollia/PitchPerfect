class VotesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def create
    p "-------------------------------------"
    p params
  end

end
