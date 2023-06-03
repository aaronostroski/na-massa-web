class Order < ApplicationRecord
  def pending?
    requested_at.nil? && accepted_at.nil? && finished_at.nil? &&
      delivered_at.nil? && cancelled_at.nil?
  end

  def requested?
    requested_at.present? && accepted_at.nil? && finished_at.nil? &&
      delivered_at.nil? && cancelled_at.nil?
  end

  def accepted?
    requested_at.present? && accepted_at.present? && finished_at.nil? &&
      delivered_at.nil? && cancelled_at.nil?
  end

  def finished?
    requested_at.present? && accepted_at.present? && finished_at.present? &&
      delivered_at.nil? && cancelled_at.nil?
  end

  def delivered?
    requested_at.present? && accepted_at.present? && finished_at.present? &&
      delivered_at.present? && cancelled_at.nil?
  end

  def cancelled?
    cancelled_at.present?
  end

  def status
    return :cancelled if cancelled?
    return :pending if pending?
    return :requested if requested?
    return :accepted if accepted?
    return :finished if finished?
    return :delivered if delivered?
  end
end
