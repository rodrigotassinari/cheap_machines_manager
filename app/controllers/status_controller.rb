class StatusController < ApplicationController

  skip_before_action :authenticate, only: [:healthcheck]

  # GET /
  # GET /ping
  def ping
    render json: {status: 'pong'}
  end

  # GET /healthcheck
  def healthcheck
    render json: {status: 'OK'}
  end

end
