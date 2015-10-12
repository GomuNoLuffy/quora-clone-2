class ImplementTags < ActiveRecord::Migration
	def change
		create_table :tags do |t|   
	      t.string :name

	      t.timestamps null: false
	  	end

	  	create_table :categories do |t|
		  t.references :question, index: true       
	      t.references :tag, index: true

	      t.timestamps null: false
	  	end		
	end
end
