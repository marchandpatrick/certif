class Address < ActiveRecord::Base
	attr_accessible  :name1, :name2, :street1, :steet2, :postalcode, :city, :countrycode, :countryname
  belongs_to :certificate

  validates_presence_of :city
end
