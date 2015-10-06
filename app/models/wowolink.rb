class Wowolink < ActiveRecord::Base

  belongs_to :workpoint
  belongs_to :workflow

  validates_uniqueness_of :workpoint_id, scope: :workflow_id

=begin
  def as_json(options={})
    super(options.merge( { include: { workpoint: { only: [:id] } } } ) )
  end
=end

end
