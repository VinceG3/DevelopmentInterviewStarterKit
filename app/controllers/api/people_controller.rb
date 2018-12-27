class Api::PeopleController < Api::BaseController
  respond_to :json

  def list
    @current_page = people_params.fetch :page, 1
    @per_page = 25
    @people = Person.cached.where(people_params).page(@current_page).per(@per_page)
    @prev_page = @current_page == 1 ? nil : @current_page - 1
    @total_count = Person.count
    @total_pages = @total_count./(@per_page.to_f).ceil
    @next_page = people_params[:page] == @total_pages ? nil : @current_page + 1
  end

  private

  def people_params
    params.permit(page: 1)
  end
end
