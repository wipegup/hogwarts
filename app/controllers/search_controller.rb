class SearchController < ApplicationController
  def index
    facade = StudentInformationFacade.new(params[:house])
    binding.pry
    render locals:{
      facade: facade
    }
  end
end
