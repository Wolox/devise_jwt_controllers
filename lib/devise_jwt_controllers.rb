require 'devise'
require 'devise/jwt'

require 'devise/jwt/controllers/version'

require 'devise/jwt/controllers/engine'
require 'devise/jwt/controllers/railtie'
require_relative 'devise/jwt/extensions/warden_helper'

require_relative 'devise/jwt/extensions/action_dispatch'
require_relative 'devise/jwt/extensions/active_support/inflector'
require_relative 'devise/jwt/overrides/devise'
