class ApiKey
  include Mongoid::Document
  field :access_token, type: String

  before_create :generate_access_token

  private
  
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while ApiKey.where(access_token: access_token).present?
  end
end
