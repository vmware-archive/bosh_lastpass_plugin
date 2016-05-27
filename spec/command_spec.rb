describe "bosh say hello" do
  let(:path) { create_path_with_executables("ruby", "git", "bosh", mock_lpass_path) }

  before(:each) do
    @output = `PATH=#{path} bosh --config #{erb_fixtures("bosh_config.erb")} lastpass show manifest`
  end
  after(:each) do
    FileUtils.rm_rf path
  end


  context "substitutes the lpass passwords " do
    let(:mock_lpass_path) { fixtures("stub_executables/success/lpass")}
    it "exits without errors" do
      expect($?.exitstatus).to eq(0)
    end

    it "successfully substitutes lpass entries" do
      hash = YAML.load(@output.split("\n")[1..-1].join("\n"))
      expect(hash["instance_groups"][0]["jobs"][0]["properties"]["username"]).to eql("entry_from_lastpass")
    end
  end

  context "lpass key/value not found" do
    let(:mock_lpass_path) { fixtures("stub_executables/key_not_found/lpass")}

    it "exits with errors" do
      expect($?.exitstatus).to eq(1)
    end

    it "displays a error message" do
      expect(@output).to include("Could not find specified account")
    end
  end

  context "lpass command not found" do
    let(:mock_lpass_path) { fixtures("stub_executables/command_not_found/lpass")}
    it "exits with errors" do
      expect($?.exitstatus).to eq(127)
    end
    it "displays a error message" do
      expect(@output).to include("BOSH Lastpass Error lastpass cli not found")
    end
  end
end

def required_executables_path(*commands)
  commands.collect{|command| File.dirname(`which #{command}`)}.uniq.join(":")
end


def create_path_with_executables(*commands)
  dir = Dir.mktmpdir
  commands.collect{|command| `which #{command}`.strip}.reject(&:empty?).each do |command|
    `ln -s #{command} #{dir}`
  end
  dir
end
