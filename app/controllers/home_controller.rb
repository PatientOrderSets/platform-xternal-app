class HomeController < ApplicationController
  def index
    @json_adt_patients = doorkeeper_access_token.get("api/adt_patients/search?per_page=10")
    respond_with @json_adt_patients
  end
end
