module API
  module V1
    class Books < Grape::API

      resource :books do

        get '', :rabl => "v1/books/raw.rabl" do
          @books = Book.all
        end

      end

    end
  end
end
