module SmsTool
  account_sid = ENV['TWILLIO_ACCOUNT_SID']
  auth_token = ENV['TWILLIO_AUTH_TOKEN']

  @client = Twilio::REST::Client.new account_sid, auth_token

  def self.send_sms(num, msg)
    @client.messages.create(
      from: ENV['TWILLIO_PHONE_NUMBER'],
      to: num,
      body: msg
    )

    p "Sending SMS..."
    p "#{msg} to #{num}"
  end
end