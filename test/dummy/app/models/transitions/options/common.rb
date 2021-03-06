# frozen_string_literal: true

module Transitions::Options
  class Common < FieldOptions
    embeds_many :field_overrides, class_name: "Transitions::Options::Common::FieldOverride"
    accepts_nested_attributes_for :field_overrides

    class FieldOverride < FieldOptions
      attribute :name, :string
      attribute :accessibility, :integer, default: 0

      attr_readonly :name
      enum accessibility: {read_and_write: 0, readonly: 1, hidden: 2},
           _prefix: :access

      validates :name,
                presence: true

      validates :accessibility,
                inclusion: {in: self.accessibilities.keys.map(&:to_sym)}

      def name
        self[:name]&.to_sym
      end

      def accessibility
        self[:accessibility]&.to_sym
      end
    end
  end
end
