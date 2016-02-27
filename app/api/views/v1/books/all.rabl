child(@books => :list) do
  extends "v1/books/show"
end

node(:pagination) do
  pagination_hash(@books)
end
