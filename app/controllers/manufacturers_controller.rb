class ManufacturersController < ApplicationController
    def index
        if params[:year_founded] != nil
            @manufacturers = Manufacturer.where(year_founded: (params[:year_founded]))
        else   
            @manufacturers = Manufacturer.all
        end
    end
end