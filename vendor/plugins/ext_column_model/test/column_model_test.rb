require File.dirname(__FILE__) + '/test_helper.rb'

class Student < ActiveRecord::Base
  act_as_ext_column_model
end

class ColumnModelTest < Test::Unit::TestCase
  load_schema

  def test_class_saw_plugin
    assert_equal "Yes class, you saw me.", Student.saw
  end

  def test_instance_saw_plugin
    student = Student.new
    assert_equal "Yes instance, you saw me.", student.saw
  end
end