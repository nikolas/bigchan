# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bigchan_session',
  :secret      => 'feddae868645d231e6aa8c642d3faa1e78ac0b3e2c0301a66d1089bbb73fe9ee3cc35f2824436245bdb0883749ea52643195d8997599ba50bff4fab810555ae5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
