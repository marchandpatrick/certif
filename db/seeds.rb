    # Seed the Certificates DB with some certificates.
    more_certificates = [
      {:Version  => '1', :ControllingInstance=> 'G',:SubType => '1', :Profile => 'pro', :DocumentID => 'AZERT',
        :IssueDate => '25-Jui-2012'},
      {:Version  => '1', :ControllingInstance=> 'G',:SubType => '1', :Profile  => 'pro', :DocumentID=> 'AZERT2',
        :IssueDate => '26-Jui-2012'}
    ]
    # NOTE: the following line temporarily allows mass assignment
    # (needed if you used attr_accessible/attr_protected in movie.rb)
    Certificate.send(:attr_accessible, :Version, :ControllingInstance, :SubType,:Profile , :DocumentID , :IssueDate)
    more_certificates.each do |certif|
      Certificate.create!(certif)
    end
    addr = {:address_attributes => {:name1 => '16 rue de la boule aux chats', :postcode => '85800', :city => 'Saint Gilles Croix de Vie'}}
    Address.create!(addr)

    cert = Certificate.find(1)
    # Normal mass-assignment
#    http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html
     cert.update_attributes(:Profile => 'promod')
    # Creates or edits the address
    params = { :certificate => { :Profile => 'promod2', :address_attributes => { :name1 => '16 rue de la boule aux chats', :postalcode => '85800', :city => 'Saint Gilles Croix de Vie'} } }
    cert.update_attributes params[:certificate]
    cert = Certificate.find(2)
    params = { :certificate => { :Profile => 'promod3', :address_attributes => { :name1 => '9 rue de la paix', :postalcode => '605700', :city => 'Andeville'} } }
    cert.update_attributes params[:certificate]


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
