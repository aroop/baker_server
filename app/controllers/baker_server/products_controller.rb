module BakerServer
  class ProductsController < ApplicationController

    inherit_resources
    actions :all
    respond_to :html

  end
end
