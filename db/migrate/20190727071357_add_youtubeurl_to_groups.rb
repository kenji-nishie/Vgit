class AddYoutubeurlToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :youtube_url, :integer
  end
end
