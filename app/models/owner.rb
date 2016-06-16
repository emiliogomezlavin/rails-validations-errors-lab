class Owner < ActiveRecord::Base
  validates :first_name, presence: true, length: {maximum: 255}
  validates :last_name, presence: true, length: {maximum: 255}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: true
  # the method below passes the rspec test but it doesn't work in the web app
  # inclusion: { in: %w(@), message: "%{value} doesn't contain the @ symbol" }

  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    if phone.present?
      phone.gsub!(/[^x' '0-9]/, '')
      if phone[0] == "1"
        phone[0] = ''
      end
    end
  end

end
