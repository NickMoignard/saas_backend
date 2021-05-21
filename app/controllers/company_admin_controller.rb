class CompanyAdminController < ApplicationController
    before_action :authenticate_user!
    before_action :set_company, only: [:index]

    def index
    end

    private
    def set_company
        @company = current_user.company;
    end
end
