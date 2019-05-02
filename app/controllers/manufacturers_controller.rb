class ManufacturersController < ApplicationController
    def index
        if params[:year_founded] != nil
            @manufacturers = Manufacturer.where(year_founded: (params[:year_founded]))
        else   
            @manufacturers = Manufacturer.all
        end
    end

    def new
        @manufacturer = Manufacturer.new
    end

    def create
        manufacturer = Manufacturer.new(manufacturer_params)
        manufacturer.save

        redirect_to manufacturers_path
    end

    private

    def manufacturer_params
        params.require(:manufacturer).permit(:name, :city, :year_founded, :logo_url)
    end
end