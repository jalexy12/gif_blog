class LabelledPost < ActiveRecord::Base
  belongs_to :post
  belongs_to :label
end
