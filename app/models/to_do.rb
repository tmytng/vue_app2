# == Schema Information
#
# Table name: to_dos
#
#  id         :bigint           not null, primary key
#  finished   :boolean          default(FALSE), not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ToDo < ApplicationRecord
end
