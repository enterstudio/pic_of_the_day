$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pic_of_the_day'

ActionMailer::Base.delivery_method = :test

require 'minitest/autorun'
