module API
  module V1
    class Links < Grape::API

      resource :links do
        get '', :rabl => "v1/links/all.rabl" do
          @links = Link.all
        end
      end

      resource :shorten do
        post '', :rabl => "v1/links/create.rabl" do
          @link = ::Parser::Link.parse(params)
          police = ::Police::Link.new(@link)

          unless police.has_url?
            error!(I18n.t('fails.link.empty_url'), 400)
          end

          unless police.is_shortcode_avaliable?
            error!(I18n.t('fails.link.unavaliable_shortcode'), 409)
          end

          unless police.is_shortcode_valid?
            error!(I18n.t('fails.link.invalid_shortcode'), 422)
          end

          @link.save
        end
      end



      resource '' do
        params do
          requires :code, type: String, desc: "Shortcode"
        end
        route_param :code do

          before do
            @link = Link.where(shortcode: params[:code]).first
            error!(I18n.t('fails.not_found'), 404) if @link.nil?
          end

          get '' do
            @link.update_attributes(
              last_seen: DateTime.now,
              redirect_count: @link.redirect_count + 1
            )
            redirect @link.url
          end

          get :stats, :rabl => "v1/links/status.rabl" do
          end

        end
      end

    end
  end
end
