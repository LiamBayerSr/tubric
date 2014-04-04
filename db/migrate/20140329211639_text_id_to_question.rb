class TextIdToQuestion < ActiveRecord::Migration
  def change
  	add_column :questions, :text1, :text
  	add_column :questions, :text2, :text
  	add_column :questions, :text3, :text
  

  end
end
