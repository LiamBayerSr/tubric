class AddDetailsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :audience, :string
    add_column :questions, :standards, :string
    add_column :questions, :products, :string
  end
end
