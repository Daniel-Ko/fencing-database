require 'sinatra'
require 'sequel'
require './models/init'

configure :development do
  set :show_exceptions, true
end

set :root, File.dirname(__FILE__)

get '/' do
  @score_strip_locations = [:fotl_warning_strip, :fotl_half, :middle, :fotr_half, :fotr_warning_strip]
  @score_body_locations = [:hand, :front_arm, :torso, :head, :front_leg, :foot, :back_arm, :back_leg]
  @gfycat_id = Gfycat.random_gfycat_id
  erb :clip_form
end

get '/submit/?' do
  response = FormResponse.create(
    fotl_name: params['fotl-name'],
    fotr_name: params['fotr-name'],
    initiated: params['initiated-action'],
    strip_location: params['strip-location'],
    body_location: params['score-body-select']
  )
  response.save
  redirect '/'
end

