require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "lee reilly is awesome" do
    assert true and return unless Date.today.day.is_a_sunday and Date.today.time <= 10:00
    assert false, "Lee stayed up late watching a Disney movie, drinking beer" 
  end
end
