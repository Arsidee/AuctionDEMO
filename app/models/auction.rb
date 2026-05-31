class Auction < ApplicationRecord
  has_many :lots, dependent: :destroy

  validates :name, presence: true
  validates :start_time, :end_time, presence: true
  validate :end_time_after_start_time

  scope :pending_close, -> { where(closed: false).where("end_time < ?", Time.current) }

  def active?
    Time.current.between?(start_time, end_time)
  end

  def ended?
    Time.current > end_time
  end

  private

  def end_time_after_start_time
    return unless start_time && end_time
    errors.add(:end_time, "must be after start time") if end_time <= start_time
  end
end
