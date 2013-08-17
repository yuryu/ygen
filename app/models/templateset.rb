class Templateset < ActiveRecord::Base
	has_many :templates
	belongs_to :user

	accepts_nested_attributes_for :templates, allow_destroy: true, reject_if: ->(t) {t[:format].blank?}
end
