class Certificate < ActiveRecord::Base
	attr_accessible  :Version, :ControllingInstance, :SubType,:Profile,:DocumentID,:IssueDate, :address_attributes
	has_one :address
	accepts_nested_attributes_for :address,
		:allow_destroy => true,
    	:reject_if     => :all_blank
end