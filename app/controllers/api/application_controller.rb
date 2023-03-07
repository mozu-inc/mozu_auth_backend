# frozen_string_literal: true

module Api
  class ApplicationController < ::ApplicationController
    def render_not_found
      render json: { code: 404 }, status: :not_found
    end
  end
end
