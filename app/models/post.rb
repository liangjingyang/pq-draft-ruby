class Post < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :box, touch: true, class_name: 'Box', inverse_of: :posts
  belongs_to :user, class_name: 'User', inverse_of: :posts
  scope :with_includes, -> { includes(:user, :box) }

  def images
    s = super || []
    ss = s.map do |i|
      if !(i =~ /^https?:\/\//)
        "#{DRAFT_CONFIG['qiniu_cname']}/#{i.gsub(/^https?:\/\/.*?\//, '')}"
      else
        i
      end
    end
    return ss
  end

  def is_mine(user)
    self.user_id == user.id
  end
    
  # self post is copied post, aim post is pasted post
  def copy_to(box)
    # not copy in same box
    return self if box.id == self.box_id
    # only update pasted_at, if already copied
    paste = box.posts.find_by(parent_id: self.id)
    now = Time.zone.now
    if paste
      paste.update_attribute(:last_pasted_at, now)
    else
      paste = box.create_post!(
        images: self.images, 
        content: self.content, 
        last_pasted_at: now,
        parent_id: self.id,
        parent_box_id: self.box.id,
        parent_box_name: self.box.name,
        user_id: box.user_id
      )
      self.update_attributes(
        last_copied_at: now,
        copied_count: self.copied_count + 1
      )
    end
    return paste
  end
end
