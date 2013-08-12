require 'spec_helper'
require 'spec_simple_models'


describe "ActiveRecordSnapshot::Snapped" do
  it "passes" do
    expect(true).to be true
  end

  context 'class concerns' do 

    ## Using Book and BookSnapshot from spec_simple_models

    describe 'class configuration' do 
      it 'should have snapshot_class_name set to klass_singular_snapshots' do 
        expect(Book.snapshot_class_name).to eq 'BookSnapshot'
      end
    end

    describe '#snapshot' do 
      it "should raise error if original attribute name doesn't exist"
      it 'should raise error if snapshot table does not exist'
      
      context 'snapshot_config' do
        it 'should create a new entry'

        context 'when:' do
          it 'should set :dirty by default'
          it 'should allow :always'
          it 'should raise error if invalid symbol is passed in'
        end
      end
    end

    describe 'named_scopes' do 

    end

  end

  context 'instance' do 

    it 'should have many snapshots'

    describe '#save_snapshot' do 

      it 'should set snapped_at to time of snapping'

      context 'when :dirty attributes' do 
        it 'should snapshot when dirtied'
        it 'should not snapshot when clean'
      end

      context 'when :always attributes' do 
        it 'should snapshot when dirtied'
        it 'should snapshot when clean'
      end      
    end

  end
end
