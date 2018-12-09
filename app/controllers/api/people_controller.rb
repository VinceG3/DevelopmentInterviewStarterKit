class Api::PeopleController < Api::BaseController
  respond_to :json

  def list
    SalesloftApiGateway.request(:all_people)
    render plain: api_results
  end

end
