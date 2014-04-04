class UserIdToQuestion < ActiveRecord::Migration
  def change
  	add_column :questions, :user_id, :integer
  	add_column :questions, :subject, :string
  	add_column :questions, :grade, :string
  	add_column :questions, :project_idea, :string
  end
end
