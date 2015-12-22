class Tree < ActiveRecord::Base
	belongs_to :profile
	has_many :relationships
	def to_node
    { "attributes" => self.attributes,
      "children"   => self.children.map { |c| c.to_node }
    }
  end
end
