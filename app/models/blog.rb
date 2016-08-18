class Blog < ActiveRecord::Base
  attr_accessible :title, :body

  def preview_contents
    return "" if self.body.blank?

    content = self.body.gsub(/<img.*\/>/, "")
    content = content[0, 400]
    contents = Nokogiri::HTML.parse(content).css('p')

    if contents.count > 1
      new_contents = [contents[0].content, contents[1].content]
    else
      new_contents = [contents[0].content]
    end

    return new_contents
  end

  def next
    self.class.where("id > ?", id).first
  end

  def prev
    self.class.where("id < ?", id).last
  end
end