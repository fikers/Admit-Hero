resources :users, except: [:edit, :update] do 
    member do
      get 'basic_info' 
      #basic_info_user_path or basic_info_user_url
      get 'tags' 
      #tags_user_path or tags_user_url
      patch 'update_tags'
    end
    
  end


class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.boolean :gpa, :default => false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

<div class="row">
    <div class="col-md-6 col-md-offset-3">
		<%= form_for(@tags) do |f| %>
			<%= f.label :summer_programs, class: "checkbox inline" do %>
				<%= f.check_box :summer_programs, {:checked=>true, :unchecked=>false} %>
				<span>Summer Programs</span>
			<% end %>
		<% end %>
	</div>
</div>
