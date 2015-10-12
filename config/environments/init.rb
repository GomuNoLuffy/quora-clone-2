# Specify gemfile Location and general variables
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

# Perform requiring gem that we need
######################################################################
	# basic
require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require 'pathname'

	# database
require 'pg'
require 'active_record'
require 'byebug'
require 'logger'

	# sinatra
require 'sinatra'
require "sinatra/reloader" if development?
require 'action_view'
require 'will_paginate'
require 'will_paginate/active_record'

	# embedded ruby
require 'erb'
require 'uri'
######################################################################


# System Setup
######################################################################
# Setup app root folder and name
APP_ROOT = Pathname.new(File.expand_path('../../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Setup sessions, logging and dump_errors
use Rack::Session::Cookie, expire_after: ENV['SESSION_EXPIRE'] || 2592000, # seconds
                           secret: ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

set :dump_errors, false
set :app_file, __FILE__
enable :sessions
set :session_secret, 'this is a secret shhhhh'

# Setup Models (M) and its database
require APP_ROOT.join('config', 'database')

# Setup helper (H)
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
helpers ActionView::Helpers::FormTagHelper

# Setup views (V)
set :views, File.join(APP_ROOT, "app", "views")

# Setup controller (C)
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
######################################################################