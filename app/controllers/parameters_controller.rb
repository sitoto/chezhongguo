#encoding: UTF-8
class ParametersController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @parameter = @car.parameters.create!(params[:parameter])
    redirect_to @car, :notice => "参数已经增加!"
  end
end

