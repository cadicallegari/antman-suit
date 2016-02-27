object @link

attributes :url, :shortcode, :last_seen, :redirect_count

node(:lastSeenDate) do |link|
  link.last_seen
end

node(:redirectCount) do |link|
  link.redirect_count
end
