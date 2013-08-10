describe "ActiveRecordSnapshot::Snapshot" do

  it 'is true baby' do 
    expect(1).to be 1
  end


  describe 'def Snapshot' do 
    it 'should create new snapshot_record'
    it 'should save proper snapped_id'
  end

  describe 'scopes' do 
    describe '#latest' do 
      it 'should return snapped_at by DESC'
    end
  end

end