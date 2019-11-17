class Api::V1::PlacesController < Api::V1::BaseController
  def index
    @places = policy_scope(Place).sort_by(&:created_at).reverse
  end
end
