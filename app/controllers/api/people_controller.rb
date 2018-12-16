class Api::PeopleController < Api::BaseController
  respond_to :json

  def list
    people_params
    @people = Person.cached.where(people_params)
  end

  private

  def people_params
    params.permit(:page)
  end
end
