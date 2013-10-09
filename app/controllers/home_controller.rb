class HomeController < ApplicationController
  respond_to :html, :json

  def index
    oauth_response = doorkeeper_access_token.get("api/adt_patients/search?per_page=10", headers: {"ACCEPT" => "application/json"})
    @json_adt_patients = oauth_response.parse

    respond_with @json_adt_patients
  end
end
