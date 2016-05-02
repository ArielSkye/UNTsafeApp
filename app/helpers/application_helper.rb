module ApplicationHelper

	require 'twilio-ruby'
 
account_sid = "ACc5f41492a98302b14af7c8537a10ad5b"
auth_token = "86d6f21f4ff412ad0f9bd4615b98c4a5"
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+19402224451" # Your Twilio number
 
contact = {
"+19403950595" => "Ariel",

}
contact.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  )
  puts "Sent message to #{value}"
end

end
