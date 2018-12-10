class Api::PeopleController < Api::BaseController
  respond_to :json

  def list
    people_params
    api_results = SalesloftApiGateway.request(:all_people, people_params.to_h)
    render plain: api_results
  end

  private

  def people_params
    params.permit(:page)
  end
end
