class Post < ApplicationRecord
  belongs_to :box, class_name: 'Box', inverse_of: :posts

  # self post is copied post, aim post is pasted post
  def copy_to(box)
    # not copy in same box
    return if box.id == self.box_id
    # only update pasted_at, if already copied
    paste = box.posts.find_by(parent_id: self.id)
    now = Time.zone.now
    if paste
      paste.update_attribute(:last_pasted_at, now)
    else
      paste = box.posts.create!(
        images: self.images, 
        content: self.content, 
        last_pasted_at: now,
        parent_id: self.id,
      )
      self.update_attributes(
        last_copied_at: now,
        copied_count: self.copied_count + 1
      )
    end
    return paste
  end
end
