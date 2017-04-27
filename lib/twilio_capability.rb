class TwilioCapability
  def self.generate()
    # To find TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN visit
    # https://www.twilio.com/user/account
    account_sid = 'AC3969179ad668e466e3340a6439e5f08d'
    auth_token  = 'eec79ef36d40ea5d0b363f2f08f598b5'
    capability = Twilio::Util::Capability.new account_sid, auth_token

    application_sid = 'APce212735865d965476ce81814e103b72'
    capability.allow_client_outgoing application_sid

    capability.generate
  end
end
