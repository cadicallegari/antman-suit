module API
  class Root < Grape::API
    # prefix 'api'
    format          :json
    default_format  :json
    formatter :json, Grape::Formatter::Rabl
    content_type :json, "application/json;charset=UTF-8"

    CORS_HEADERS = {
      'Access-Control-Allow-Origin'   => '*',
      'Access-Control-Allow-Methods'  => 'POST, GET, PUT',
      "Access-Control-Allow-Headers"  => "Content-Type",
      "Content-Type"                  => "application/json; charset=UTF-8"
    }


    error_formatter :json, lambda { |message, backtrace, options, env|
      # API.logger.error "<====== Returning: #{message}"
      {error: message}.to_json
    }

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      # API.logger.error "<====== Returning: #{e.message}"
      rack_response({ error: e.message }.to_json, 406, CORS_HEADERS)
    end

    rescue_from :all do |e|
      # API.logger.error "[FATAL] rescued from API #{e.class.name}: #{e.to_s} in #{e.backtrace.first}"
      # API.logger.error e.message
      rack_response({ error: e.message }.to_json, 500, CORS_HEADERS)
    end


    mount API::V1::Root

    route :any, '*path' do
      error!(I18n.t('fails.not_found'), 404)
    end

  end
end

