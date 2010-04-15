# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_leereilly.net_session',
  :secret      => '5339df872851e755cd2f3fb993597b51684f29e77017c2266c50b6cfd92af2c29b15b6df3aef1c900ae0fa282ca23a8b5c734d32b991fcf4c49d7975e202c97c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
