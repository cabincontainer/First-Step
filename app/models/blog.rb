class Blog < ActiveRecord::Base
  attr_accessible :title, :body

  def preview_contents
    content = self.body.gsub(/<img.*\/>/, "")
    content = content[0, 400]
    contents = Nokogiri::HTML.parse(content).css('p')

    return [contents[0].content, contents[1].content]
  end

  def next
    self.class.where("id > ?", id).first
  end

  def prev
    self.class.where("id < ?", id).last
  end
end