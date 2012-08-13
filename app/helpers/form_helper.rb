# app/helpers/form_helper.rb
module FormHelper
  def setup_certificate(certificate)
    certificate.address ||= Address.new
    certificate
  end
end