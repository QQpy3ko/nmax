RSpec.describe Nmax do
  it "has a version number" do
    expect(Nmax::VERSION).not_to be nil
  end

  context "if no integers found during the run" do
    let(:stdin) {File.open(File.join(File.dirname(__FILE__), 'no_integers.txt'), 'r+')}
    let(:run) {Nmax::NmaxRunner.run(15, stdin)}
    it "empty result" do
      expect(run).to eq([])
    end
    it "notification about no integers found" do
      expect(STDOUT).to receive(:puts).with('No integers in the source')
      run
    end
  end

  context "if lack of integers found during the run" do
    let(:stdin) {File.open(File.join(File.dirname(__FILE__), 'with_18_integers.txt'), 'r+')}
    let(:run) {Nmax::NmaxRunner.run(20, stdin)}
    it "notification about lack of integers" do
      expect(STDOUT).to receive(:puts).with('Count of integers in the source: 18')
      run
    end
  end

  context "if enough of integers found during the run" do
    let(:stdin) {File.open(File.join(File.dirname(__FILE__), 'with_18_integers.txt'), 'r+')}
    let(:run) {Nmax::NmaxRunner.run(5, stdin)}
    it "correct size of resulting array" do
      expect(run).to eq([34535, 28897, 6927, 5678, 1986])
    end
  end
end
