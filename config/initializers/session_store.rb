# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_map_session',
  :secret      => '760f03db1bd0000336756a09c94b530176d70fc4d32a6b0600470ae530980bb39a01f20f5f7ba3461651ed2a83838746d7fc530cbf76f4399af2c66405080632'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
