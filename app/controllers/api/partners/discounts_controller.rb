module Api
  module Partners
    class DiscountsController < ApplicationController
      before_action :authenticate

      def index
        discounts = Discount.all.map do |d|
          {
            name: d.title,
            email: d.email,
            expiration_date: d.expiration_date,
            description: d.description,
            image_url: url_for(d.image) # Shrine + Rails URL helper
          }
        end
        render json: discounts
      end

      private

      # HTTP Basic Auth
      def authenticate
        authenticate_or_request_with_http_basic do |username, password|
          username == "partner" && password == "secret"
        end
      end
    end
  end
end
