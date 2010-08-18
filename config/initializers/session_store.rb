# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_smart_filters_demo_session',
  :secret      => '8b347a9e140f818c31e21fa51ec8d0c0a17d429645b00b5d5c051c256f659681ea949d4d8ddefdd8f8195f80bd1b87258e2df48009ecbd62aa10c9523a122bab'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
