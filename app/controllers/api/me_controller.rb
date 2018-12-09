class Api::MeController < Api::BaseController
  def me
    current_user ? (respond_with({ user: current_user })) : respond_with {}
  end
end
