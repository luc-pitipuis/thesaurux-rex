class AddMetadataToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :metadata, :string
  end
end
