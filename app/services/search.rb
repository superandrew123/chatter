class Search

  def self.search(query)
    if query[0] == "@"
      clean_search = "%#{query[1..-1]}%"
      Search.search_user(clean_search)
    elsif query[0] == "#"
      clean_search = "%#{query[1..-1]}%"
      Search.search_tag(clean_search)
    else
      clean_search = "%#{query}%"
      Search.search_all(clean_search)
    end
  end

  def self.search_user(q)
    User.where("handle LIKE ? or name LIKE ?", q, q) 
  end

  def self.search_tag(q)
    Post.where("post_content LIKE ?", q) 
  end

  def self.search_all(q)
    results = []
    results[0] = Search.search_user(q)
    results[1] = Search.search_tag(q)
    results.flatten
  end
end