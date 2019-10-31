module Spree
  class Designs::AppConfiguration < Preferences::Configuration
    preference :tags, :array, default: [:holidays, :occasions, :recipients, :colors]

    preference :sizes, :array, default: [:bordeaux, :square, :teardrop, :woodbox_single, :woodbox_double, :woodbox_triple, :vueve]

    preference :mediums, :array, default: [:label, :engraving]
  end
end