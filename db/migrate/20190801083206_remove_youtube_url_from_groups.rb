class RemoveYoutubeUrlFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :youtube_url, :integer
  end
end
