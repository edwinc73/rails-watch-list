class ApplicationController < ActionController::Base
  before_action {@user = User.first}
end
