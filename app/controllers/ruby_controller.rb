class RubyController < ApplicationController
  require "httpclient"
  def index
    @ruby = get_microcms

    # return render template: "error/error_404",status: 404,content-type "text/html" unless @ruby.present?
  end

  def show
    @ruby = get_microcms(params[:id])
    # return render template: "error/error_404",status: 404,content-type: "text/html" unless @ruby.present?
  end

  private
  def get_microcms(id=nil)
    client = HTTPClient.new()
    response = client.get(
      "https://kazutter.microcms.io/api/v1/ruby/#{id}",
      header: {"X-API-KEY": ENV["API_KEY"]}
    )
    return nil unless response.status == 200

    JSON.parse(response.body, symbolize_names: true)
  end
end
