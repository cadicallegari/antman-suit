object @link

node(:lastSeenDate) do |link|
  link.last_seen
end

node(:redirectCount) do |link|
  link.redirect_count
end

node(:startDate) do |link|
  link.created_at
end
