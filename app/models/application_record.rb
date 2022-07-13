# class ApplicationRecord < ActiveRecord::Base
#   primary_abstract_class
# end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
