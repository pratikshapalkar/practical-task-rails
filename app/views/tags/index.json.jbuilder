json.set! :data do
  json.array! @tags do |tag|
    json.partial! 'tags/tag', tag: tag
    json.url  "
              #{link_to 'Show', tag }
              #{link_to 'Edit', edit_tag_path(tag)}
              #{link_to 'Destroy', tag, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end