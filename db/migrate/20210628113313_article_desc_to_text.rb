class ArticleDescToText < ActiveRecord::Migration
  def up
    change_column :articles, :desc, :text
  end

  def down
  end
end
