class Signup
  def initialize(params, api_key)
    @params = params
    @api_key = api_key
  end

  def call
    return false unless user.save
    if tokenplay_user.error?
      user.destroy
      return false
    end

    user
  end

  def error
    @error ||= tokenplay_user.error? ? tokenplay_user.to_s : nil
  end

  private

  def tokenplay_user
    @tokenplay_user ||= TokenPlay::User.create(tokenplay_params)
  end

  def tokenplay_params
    {
      provider_user_id: user.provider_user_id,
      username: user.email,
      metadata: {
        email: user.email,
        first_name: user.first_name,
        last_name: user.last_name
      }
    }
  end

  def user
    @user ||= User.find_by(email: @params[:email]) || User.new(@params)
  end
end
