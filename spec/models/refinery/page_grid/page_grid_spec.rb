require 'spec_helper'

module Refinery
  module PageGrid
    describe PageGrid do
      describe "validations" do
        subject do
          FactoryGirl.create(:page_grid)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
