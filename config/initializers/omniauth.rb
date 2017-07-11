OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '262194640852508', '66ad185c6801cce3a7021c2bd625d60f'
end
