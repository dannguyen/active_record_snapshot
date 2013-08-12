require 'spec_helper'
require 'spec_simple_models'


describe "ActiveRecordSnapshot::Snapped" do
  it "passes" do
    expect(true).to be true
  end

  context 'class concerns' do 

    ## Using Book and BookSnapshot from spec_simple_models

    describe 'class configuration' do 
      it 'should have snapshot_class_name set to KlassSingularSnapshot' do 
        expect(Book.snapshot_class_name).to eq 'BookSnapshot'
      end

      it 'should have :snapshot_table_name set to klass_singular_snapshots' do 
        expect(Book.snapshot_table_name).to eq 'book_snapshots'
      end
    end

    describe '#snapshot' do 
      it "should raise error if original attribute name doesn't exist" do 
        expect{Book.snapshot :not_attr}.to raise_error ActiveRecord::UnknownAttributeError
      end


      it 'should raise error if snapshot table does not exist'
      

      context 'snapshot_config' do
        it 'should create a new entry' do 
          # TODO: Book already exists as a class and has this set, but I'm lazy
          # check spec_simple_models.rb to see snapshot config

          # this has already been called: snapshot :title
          expect(Book.snapshot_config.title).to be_a Hashie::Mash
        end

        context 'when:' do
          it 'should set :dirty by default' do 
            expect(Book.snapshot_config[:title][:when]).to eq :dirty
          end

          it 'should allow :always' do 
            expect(Book.snapshot_config[:price][:when]).to eq :always
          end

          it 'should raise error if invalid symbol is passed in' do 
            expect{Book.snapshot :title, :when => :whatever}.to raise_error ArgumentError
          end

        end
      end
    end

    describe 'named_scopes for instances' do 
      before(:each) do 
        # not testing actual construction, just building by hand
        @book = Book.create(title: 'Moby Dick', price: 10.20)
        BookSnapshot.create(title: 'Moby Dick', price: 5.00, snapped_id: @book.id)
        BookSnapshot.create(title: 'Moby Dick', price: 2.00, snapped_id: @book.id)
      end

      it 'should has_many :snapshots' do 
        expect(@book.snapshots.count).to eq 2
        expect(Book.count).to eq 1 # not needed really
      end
    end

  end

  context 'instance' do 

    describe '#save_snapshot' do 

      before(:each) do 

        Delorean.time_travel_to "1999-01-01 00:00:00" do 
          @book = Book.create(title: 'Gatsby', price: 42.30, edition: 1, rank: 3)
        end
        
        Delorean.time_travel_to "2000-01-01 00:00:00" do 
          @book.assign_attributes(title: 'Gatsby', price: 43.50, edition: 2)
          @snapshot = @book.save_snapshot
        end

      end

      context 'when :dirty attributes' do 
        it 'should snapshot when dirtied' do 
          expect(@snapshot.edition).to eq 2
        end

        it 'should not snapshot when clean' do 
          expect(@snapshot.title).to be_nil
        end
      end

      context 'when :always attributes' do 
        it 'should snapshot when dirtied' do 
          expect(@snapshot.price).to eq 43.50
        end

        it 'should snapshot when clean' do 
          expect(@snapshot.rank).to eq 3
        end
      end      


      it 'should set :snapped_at to time of snapping' do 
        expect(@snapshot.snapped_at.year).to eq 2000
      end

      context 'snapshot taken *after* save' do 
        it 'should not be any dirty attributes to save upon (by definition)'
      end


      

    end

    describe 'optional before_save hook' do 
      it 'should save_snapshot with every record save'
    end

  end
end
