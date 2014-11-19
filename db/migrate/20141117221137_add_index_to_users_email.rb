class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
	  add_index "users", "email", name: "index_users_on_email", unique: true
	  add_index "users", "remember_token", name: "index_users_on_remember_token"
  end
end
