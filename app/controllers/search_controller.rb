class SearchController < ApplicationController
  def index
    facade = StudentInformationFacade.new(params[:house])
    render locals:{
      facade: facade
    }
  end
end
