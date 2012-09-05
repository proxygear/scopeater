require 'spec_helper'

MONGOID_SPEC_CASES = {
  model: MongoidModel,
  criteria: Mongoid::Criteria.new(MongoidModel)
}