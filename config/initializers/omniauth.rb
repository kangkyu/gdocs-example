Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
    scope: 'email,profile,documents,documents.readonly,spreadsheets,spreadsheets.readonly'
end
OmniAuth.config.allowed_request_methods = %i[post]
# OmniAuth.config.logger = Rails.logger
