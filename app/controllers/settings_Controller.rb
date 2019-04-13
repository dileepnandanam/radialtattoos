class SettingsController < ApplicationController
  def update
  	Setting.find(params[:id]).update(params.require(:setting).permit(:value))
  	render body: nil, status: :ok
  end
end