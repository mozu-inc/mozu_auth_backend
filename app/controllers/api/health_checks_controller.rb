# frozen_string_literal: true

module Api
  class HealthChecksController < ApplicationController
    def index
      head :ok
    end
  end
end
