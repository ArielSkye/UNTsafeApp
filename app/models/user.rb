class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :pins
   has_one :recipient
   has_one :phone
   has_many :safetypins
   
   validates :contactname, presence: true
   validates :contactnumber, presence: true
   validates :contactnumber, :phone_number => {:ten_digits => true, :message => "Invalid phone number. Please enter a 10-digit number."}

  def send_text_message
    number_to_send_to = user.contactnumber
    twilio_sid = ENV["ACc5f41492a98302b14af7c8537a10ad5b"]
    twilio_token = ENV["T86d6f21f4ff412ad0f9bd4615b98c4a5"]
    twilio_phone_number = ENV["+19402224451"]
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    @twilio_client.account.sms.messages.create(
      :from => "+19402224451",
      :to => number_to_send_to,
      :body => message
    )
 end

   
end
