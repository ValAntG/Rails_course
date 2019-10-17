class TicketByTrainValidator < ActiveModel::Validator
  def validate(record)
    if record.rsr_last.route.train.blank?
      record.errors[:base] << "There are no trains on this route"
    end
  end
end