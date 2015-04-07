class DeleteExpired

  def self.start
    Post.all.each do |post|
      if post.expired && post.expired < Time.now
       post.destroy
      end
    end
  end

end
