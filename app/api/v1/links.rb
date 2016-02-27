module API
  module V1
    class Links < Grape::API

      resource :links do
        get '', :rabl => "v1/links/all.rabl" do
          @links = Link.all
        end
      end


    end
  end
end
