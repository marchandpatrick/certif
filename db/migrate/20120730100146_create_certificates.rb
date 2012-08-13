class CreateCertificates < ActiveRecord::Migration
  def up
        create_table 'certificates' do |t|
          t.string 'Version'
          t.string 'ControllingInstance'
          t.string 'SubType'
          t.string 'Profile'
          t.string 'DocumentID'
          # t.text 'description'
          t.datetime 'IssueDate'
          # Add fields that let Rails automatically keep track
          # of when movies are added or modified:
          t.timestamps
        end
        create_table :addresses do |t|
          t.references :certificate
          t.string :name1
          t.string :name2
          t.string :street1
          t.string :street2
          t.string :postalcode
          t.string :city, :null => false
          t.string :countrycode
          t.string :countryname
          t.timestamps
        end

  end

  def down
        drop_table 'certificates' # deletes the whole table and all its data!
        drop_table :addresses
  end 
end