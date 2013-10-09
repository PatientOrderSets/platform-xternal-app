class SessionsController < Devise::SessionsController
  protect_from_forgery except: :jwt

  def jwt
    oauth_response = doorkeeper_access_token.get("api/adt_patients/search?per_page=10", headers: {"ACCEPT" => "application/json"})
    @json_adt_patients = oauth_response.parsed

    respond_with @json_adt_patients
  end
end