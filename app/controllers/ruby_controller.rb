class RubyController < ApplicationController
  require "httpclient"
  def index
    @ruby = microcms

  end

  def show
    @ruby = microcms(params[:id])
  end

  private
  def microcms(id=nil)
    client = HTTPClient.new
    response = client.get(
      "https://kazutter.microcms.io/api/v1/ruby/#{id}",
      header: {"X-API-KEY": Rails.application.credentials.microcms[:api_key]}
    )
    raise ActiveRecord::RecordNotFound if response.status == 404
    raise Exception unless response.status == 200

    JSON.parse(response.body, symbolize_names: true)
  end
end
