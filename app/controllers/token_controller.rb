class TokenController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def generate
    token = ::TwilioCapability.generate()
    render json: { token: token }
  end

end