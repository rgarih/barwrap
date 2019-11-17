class Api::V1::CheckInsController < Api::V1::BaseController
  def index
    @checkins = policy_scope(CheckIn).sort_by(&:created_at).reverse
  end

  def nearby
    @places = policy_scope(Place).geocoded
    @nearby_places = @places.near(fetch_location, 1)
  end
end
