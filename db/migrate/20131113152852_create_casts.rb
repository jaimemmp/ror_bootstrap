class CreateCasts < ActiveRecord::Migration
  # db:migrate
  def up
    create_table :casts do |t|
      t.references :movie, index: true
      t.references :person, index: true
      t.string :role
 
      t.timestamps
    end
 
    Person.find_each do |p|
      Cast.create({movie: p.movie, person: p})
    end
    remove_column :people, :movie_id
  end
 
  # db:rollback
  def down
    add_column :people, :movie_id, :string
    Cast.find_each do |c|
      c.person.movie = c.movie
      c.person.save
    end
 
    drop_table :casts
  end
end