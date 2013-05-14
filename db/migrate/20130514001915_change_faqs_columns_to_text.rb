class ChangeFaqsColumnsToText < ActiveRecord::Migration
  def self.up
   change_column :faqs, :question, :text
   change_column :faqs, :answer, :text
  end

  def self.down
   change_column :faqs, :question, :text
   change_column :faqs, :answer, :text
  end
end
