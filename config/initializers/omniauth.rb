Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '571534276763605', '904d65e50fda0df6e924823f6aaafa30'
  end