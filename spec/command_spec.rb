
describe "bosh say hello" do
  context "substitutes the lpass passwords " do
    before do
      output_manifest = `bosh --config #{fixtures("bosh_config")} lastpass show manifest`
      puts output_manifest
    end

    it "exits without errors" do
      expect($?.exitstatus).to eq(0)
    end

    it "successfully substitutes lpass entries" do
    end
  end

  context "lpass key/value not found" do
  end

  context "lpass command not found" do
  end


end
