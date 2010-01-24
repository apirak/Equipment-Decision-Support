#require 'test_helper'
require File.dirname(__FILE__) + '/test_helper.rb'

class ExtColumnModelTest < ActiveSupport::TestCase
  load_schema

  class Student < ActiveRecord::Base
  end

  def test_schema_has_loaded_correctly
    assert_equal [], Student.all
  end
end