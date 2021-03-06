class CallController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_action :authenticate_user!, :only => [:connect]

  def connect
    render xml: twilio_reponse.to_xml
  end

  private

  def twilio_reponse
    twilio_number = '+12403923523'

    Twilio::TwiML::Response.new do |response|
      response.Dial callerId: twilio_number do |dial|
        if params.include?(:phoneNumber)
          dial.Number params[:phoneNumber]
        else
          dial.Client('support_agent')
        end
      end
    end
  end
end