class CreateMainStructure < ActiveRecord::Migration
  	def change
    	create_table :students do |t|
    		t.string :name
    		t.string :surname
    		t.string :email
    		t.integer :group
    		t.date :birth
    		t.timestamps
    		t.text :opinion
    		t.float :average_mark
            t.inet :ip
    	end

    	create_table :subjects do |t|
    		t.string :subject
    	end
    	
    	create_table :marks do |t|
    		t.belongs_to :subject
    		t.belongs_to :student
    		t.integer :mark
    		t.integer :semestr
		end
  	end
end
