class TicketByTrainValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << 'There are no trains on this route' if record.rsr_last.route.train.blank?
  end
end
