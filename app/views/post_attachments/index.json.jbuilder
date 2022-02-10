json.set! :data do
  json.array! @post_attachments do |post_attachment|
    json.partial! 'post_attachments/post_attachment', post_attachment: post_attachment
    json.url  "
              #{link_to 'Show', post_attachment }
              #{link_to 'Edit', edit_post_attachment_path(post_attachment)}
              #{link_to 'Destroy', post_attachment, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end