describe "bosh say hello" do

  before do
    system("bosh say hello > /dev/null")
  end

  it "exits without errors" do
    expect($?.exitstatus).to eq(0)
  end

end
