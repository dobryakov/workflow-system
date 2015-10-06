class Document < ActiveRecord::Base

  has_many :attaches, as: :attachable

  def clone_self
    self.dup
  end

end
