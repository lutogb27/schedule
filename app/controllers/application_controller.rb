class ApplicationController < ActionController::Base
  before_action :today
    def today
        @today = Date.current.strftime("%Y/%m/%d")
    end
end
