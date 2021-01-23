class Api::BaseController < ApplicationController
    before_action :format_dates

    private

    def format_dates
        @start_date = params[:start_date]
        @end_date = params[:end_date]
    end
end