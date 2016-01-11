class AddPaperclipToPost < ActiveRecord::Migration
  def change
    add_attachment :posts, :book
  end
end
