Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '331242803613854', '98f4b29acba9f54af17650f4e297c3c5'
end
