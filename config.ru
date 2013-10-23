require 'sinatra'
require "sass/plugin/rack"
require './app.rb'

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

run Sinatra::Application
